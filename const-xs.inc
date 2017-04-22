BOOT:
  {
#ifdef dTHX
    dTHX;
#endif
    HV *symbol_table = get_hv("GD::", GV_ADD);

    static const struct iv_s values_for_iv[] =
      {
#ifdef GD_CMP_IMAGE
        { "GD_CMP_IMAGE", 12, GD_CMP_IMAGE },
#endif
#ifdef GD_CMP_NUM_COLORS
        { "GD_CMP_NUM_COLORS", 17, GD_CMP_NUM_COLORS },
#endif
#ifdef GD_CMP_COLOR
        { "GD_CMP_COLOR", 12, GD_CMP_COLOR },
#endif
#ifdef GD_CMP_SIZE_X
        { "GD_CMP_SIZE_X", 13, GD_CMP_SIZE_X },
#endif
#ifdef GD_CMP_SIZE_Y
        { "GD_CMP_SIZE_Y", 13, GD_CMP_SIZE_Y },
#endif
#ifdef GD_CMP_TRANSPARENT
        { "GD_CMP_TRANSPARENT", 18, GD_CMP_TRANSPARENT },
#endif
#ifdef GD_CMP_BACKGROUND
        { "GD_CMP_BACKGROUND", 17, GD_CMP_BACKGROUND },
#endif
#ifdef GD_CMP_INTERLACE
        { "GD_CMP_INTERLACE", 16, GD_CMP_INTERLACE },
#endif
#ifdef GD_CMP_TRUECOLOR
        { "GD_CMP_TRUECOLOR", 16, GD_CMP_TRUECOLOR },
#endif
#ifdef GD_PIXELATE_UPPERLEFT
        { "GD_PIXELATE_UPPERLEFT", 21, GD_PIXELATE_UPPERLEFT },
#endif
#ifdef GD_PIXELATE_AVERAGE
        { "GD_PIXELATE_AVERAGE", 19, GD_PIXELATE_AVERAGE },
#endif
#ifdef gdBrushed
        { "gdBrushed", 9, gdBrushed },
#endif
#ifdef gdDashSize
        { "gdDashSize", 10, gdDashSize },
#endif
#ifdef gdMaxColors
        { "gdMaxColors", 11, gdMaxColors },
#endif
#ifdef gdStyled
        { "gdStyled", 8, gdStyled },
#endif
#ifdef gdStyledBrushed
        { "gdStyledBrushed", 15, gdStyledBrushed },
#endif
#ifdef gdTiled
        { "gdTiled", 7, gdTiled },
#endif
#ifdef gdTransparent
        { "gdTransparent", 13, gdTransparent },
#endif
#ifdef gdAntiAliased
        { "gdAntiAliased", 13, gdAntiAliased },
#endif
#ifdef gdArc
        { "gdArc", 5, gdArc },
#endif
#ifdef gdPie
        { "gdPie", 5, gdPie },
#endif
#ifdef gdChord
        { "gdChord", 7, gdChord },
#endif
#ifdef gdNoFill
        { "gdNoFill", 8, gdNoFill },
#endif
#ifdef gdEdged
        { "gdEdged", 7, gdEdged },
#endif
#ifdef gdEffectReplace
        { "gdEffectReplace", 15, gdEffectReplace },
#endif
#ifdef gdEffectAlphaBlend
        { "gdEffectAlphaBlend", 18, gdEffectAlphaBlend },
#endif
#ifdef gdEffectNormal
        { "gdEffectNormal", 14, gdEffectNormal },
#endif
#ifdef gdEffectOverlay
        { "gdEffectOverlay", 15, gdEffectOverlay },
#endif
#ifdef gdEffectMultiply
        { "gdEffectMultiply", 16, gdEffectMultiply },
#endif
#ifdef gdAlphaMax
        { "gdAlphaMax", 10, gdAlphaMax },
#endif
#ifdef gdAlphaOpaque
        { "gdAlphaOpaque", 13, gdAlphaOpaque },
#endif
#ifdef gdAlphaTransparent
        { "gdAlphaTransparent", 18, gdAlphaTransparent },
#endif
#ifdef gdRedMax
        { "gdRedMax", 8, gdRedMax },
#endif
#ifdef gdGreenMax
        { "gdGreenMax", 10, gdGreenMax },
#endif
#ifdef gdBlueMax
        { "gdBlueMax", 9, gdBlueMax },
#endif
#ifdef GD_MAJOR_VERSION
        { "GD_MAJOR_VERSION", 16, GD_MAJOR_VERSION },
#endif
#ifdef GD_MINOR_VERSION
        { "GD_MINOR_VERSION", 16, GD_MINOR_VERSION },
#endif
#ifdef GD_RELEASE_VERSION
        { "GD_RELEASE_VERSION", 18, GD_RELEASE_VERSION },
#endif
#ifdef GD_FLIP_HORINZONTAL
        { "GD_FLIP_HORINZONTAL", 19, GD_FLIP_HORINZONTAL },
#endif
#ifdef GD_FLIP_VERTICAL
        { "GD_FLIP_VERTICAL", 16, GD_FLIP_VERTICAL },
#endif
#ifdef GD_FLIP_BOTH
        { "GD_FLIP_BOTH", 12, GD_FLIP_BOTH },
#endif
#ifdef GD_RESOLUTION
        { "GD_RESOLUTION", 13, GD_RESOLUTION },
#endif
#ifdef GD_DEFAULT
        { "GD_DEFAULT", 10, GD_DEFAULT },
#endif
#ifdef GD_BELL
        { "GD_BELL", 7, GD_BELL },
#endif
#ifdef GD_BESSEL
        { "GD_BESSEL", 9, GD_BESSEL },
#endif
#ifdef GD_BILINEAR_FIXED
        { "GD_BILINEAR_FIXED", 17, GD_BILINEAR_FIXED },
#endif
#ifdef GD_BICUBIC
        { "GD_BICUBIC", 10, GD_BICUBIC },
#endif
#ifdef GD_BICUBIC_FIXED
        { "GD_BICUBIC_FIXED", 16, GD_BICUBIC_FIXED },
#endif
#ifdef GD_BLACKMAN
        { "GD_BLACKMAN", 11, GD_BLACKMAN },
#endif
#ifdef GD_BOX
        { "GD_BOX", 6, GD_BOX },
#endif
#ifdef GD_BSPLINE
        { "GD_BSPLINE", 10, GD_BSPLINE },
#endif
#ifdef GD_CATMULLROM
        { "GD_CATMULLROM", 13, GD_CATMULLROM },
#endif
#ifdef GD_GAUSSIAN
        { "GD_GAUSSIAN", 11, GD_GAUSSIAN },
#endif
#ifdef GD_GENERALIZED_CUBIC
        { "GD_GENERALIZED_CUBIC", 20, GD_GENERALIZED_CUBIC },
#endif
#ifdef GD_HERMITE
        { "GD_HERMITE", 10, GD_HERMITE },
#endif
#ifdef GD_HAMMING
        { "GD_HAMMING", 10, GD_HAMMING },
#endif
#ifdef GD_HANNING
        { "GD_HANNING", 10, GD_HANNING },
#endif
#ifdef GD_MITCHELL
        { "GD_MITCHELL", 11, GD_MITCHELL },
#endif
#ifdef GD_NEAREST_NEIGHBOUR
        { "GD_NEAREST_NEIGHBOUR", 20, GD_NEAREST_NEIGHBOUR },
#endif
#ifdef GD_POWER
        { "GD_POWER", 8, GD_POWER },
#endif
#ifdef GD_QUADRATIC
        { "GD_QUADRATIC", 12, GD_QUADRATIC },
#endif
#ifdef GD_SINC
        { "GD_SINC", 7, GD_SINC },
#endif
#ifdef GD_TRIANGLE
        { "GD_TRIANGLE", 11, GD_TRIANGLE },
#endif
#ifdef GD_WEIGHTED4
        { "GD_WEIGHTED4", 12, GD_WEIGHTED4 },
#endif
#ifdef GD_LINEAR
        { "GD_LINEAR", 9, GD_LINEAR },
#endif
#ifdef GD_METHOD_COUNT
        { "GD_METHOD_COUNT", 15, GD_METHOD_COUNT },
#endif
#ifdef GD_AFFINE_TRANSLATE
        { "GD_AFFINE_TRANSLATE", 19, GD_AFFINE_TRANSLATE },
#endif
#ifdef GD_AFFINE_SCALE
        { "GD_AFFINE_SCALE", 15, GD_AFFINE_SCALE },
#endif
#ifdef GD_AFFINE_ROTATE
        { "GD_AFFINE_ROTATE", 16, GD_AFFINE_ROTATE },
#endif
#ifdef GD_AFFINE_SHEAR_HORIZONTAL
        { "GD_AFFINE_SHEAR_HORIZONTAL", 26, GD_AFFINE_SHEAR_HORIZONTAL },
#endif
#ifdef GD_AFFINE_SHEAR_VERTICAL
        { "GD_AFFINE_SHEAR_VERTICAL", 24, GD_AFFINE_SHEAR_VERTICAL },
#endif
        { NULL, 0, 0 } };
	const struct iv_s *value_for_iv = values_for_iv;
        while (value_for_iv->name) {
	    constant_add_symbol(aTHX_  symbol_table, value_for_iv->name,
				value_for_iv->namelen, newSViv(value_for_iv->value));
            ++value_for_iv;
	}
	if (C_ARRAY_LENGTH(values_for_notfound) > 1) {
#ifndef SYMBIAN
	    HV *const constant_missing = get_missing_hash(aTHX);
#endif
	    const struct notfound_s *value_for_notfound = values_for_notfound;
	    do {

		/* Need to add prototypes, else parsing will vary by platform.  */
		HE *he = (HE*) hv_common_key_len(symbol_table,
						 value_for_notfound->name,
						 value_for_notfound->namelen,
						 HV_FETCH_LVALUE, NULL, 0);
		SV *sv;
#ifndef SYMBIAN
		HEK *hek;
#endif
		if (!he) {
		    Perl_croak(aTHX_ 
			       "Couldn't add key '%s' to %%GD::",
			       value_for_notfound->name);
		}
		sv = HeVAL(he);
		if (!SvOK(sv) && SvTYPE(sv) != SVt_PVGV) {
		    /* Nothing was here before, so mark a prototype of ""  */
		    sv_setpvn(sv, "", 0);
		} else if (SvPOK(sv) && SvCUR(sv) == 0) {
		    /* There is already a prototype of "" - do nothing  */
		} else {
		    /* Someone has been here before us - have to make a real
		       typeglob.  */
		    /* It turns out to be incredibly hard to deal with all the
		       corner cases of sub foo (); and reporting errors correctly,
		       so lets cheat a bit.  Start with a constant subroutine  */
		    CV *cv = newCONSTSUB(symbol_table,
					 value_for_notfound->name,
					 &PL_sv_yes);
		    /* and then turn it into a non constant declaration only.  */
		    SvREFCNT_dec(CvXSUBANY(cv).any_ptr);
		    CvCONST_off(cv);
		    CvXSUB(cv) = NULL;
		    CvXSUBANY(cv).any_ptr = NULL;
		}
#ifndef SYMBIAN
		hek = HeKEY_hek(he);
		if (!hv_common(constant_missing, NULL, HEK_KEY(hek),
 			       HEK_LEN(hek), HEK_FLAGS(hek), HV_FETCH_ISSTORE,
			       &PL_sv_yes, HEK_HASH(hek)))
		    Perl_croak(aTHX_  "Couldn't add key '%s' to missing_hash",
			       value_for_notfound->name);
#endif
	    } while ((++value_for_notfound)->name);
	}
    /* As we've been creating subroutines, we better invalidate any cached
       methods  */
    mro_method_changed_in(symbol_table);
  }

void
AUTOLOAD()
    PROTOTYPE: DISABLE
    PREINIT:
	SV *sv = newSVpvn_flags(SvPVX(cv), SvCUR(cv), SVs_TEMP | SvUTF8(cv));
	const COP *cop = PL_curcop;
    PPCODE:
#ifndef SYMBIAN
	/* It's not obvious how to calculate this at C pre-processor time.
	   However, any compiler optimiser worth its salt should be able to
	   remove the dead code, and hopefully the now-obviously-unused static
	   function too.  */
	HV *constant_missing = (C_ARRAY_LENGTH(values_for_notfound) > 1)
	    ? get_missing_hash(aTHX) : NULL;
	if ((C_ARRAY_LENGTH(values_for_notfound) > 1)
	    ? hv_exists_ent(constant_missing, sv, 0) : 0) {
	    sv = newSVpvf("Your vendor has not defined GD macro %" SVf
			  ", used at %" COP_FILE_F " line %d\n", sv,
			  COP_FILE(cop), CopLINE(cop));
	} else
#endif
	{
	    sv = newSVpvf("%"SVf" is not a valid GD macro at %"
			  COP_FILE_F " line %d\n", sv, COP_FILE(cop), CopLINE(cop));
	}
	croak_sv(sv_2mortal(sv));
