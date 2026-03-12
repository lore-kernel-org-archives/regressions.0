Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D353F87E6
	for <regressions@lists.linux.dev>; Thu, 12 Mar 2026 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773332999; cv=pass; b=of9GdFXiPUJ4WQNKtnd7h52YJXlhUKsPQYyu8MZzzIifG+ipO5wuvzlzlZO9UvZf/epBsksh8EKc6tm/vwd0XSLoHCFREatK+hezh/krZ5RV9eoBAmcy1fvRFcuylmRz6pnvL3EJsSvMD7rxDVp7lU4Nm/yuCTM6ABSPO3bhZ24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773332999; c=relaxed/simple;
	bh=ca3P/9bpWxpAzHAvhfCefleRZXKyY3EW6gZMJdOkXTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DS9+F2VYwGtOQIplhIDHTMo1Hia4ndrYgE6fUtgBqYOljG9xPjBxumfjWvYiNBU0Q43cPMVfWhRyCTL2UHG33goSb791CQxmoEiurLPgyl8KKhJiawMLPrX4ju18+WBzdZvth5YzvGxJoUYWVYRk9JCqoUcMb/ggQxORw8T/EGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRxp7o6P; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRxp7o6P"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64c9a6d68e5so1099815d50.3
        for <regressions@lists.linux.dev>; Thu, 12 Mar 2026 09:29:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773332991; cv=none;
        d=google.com; s=arc-20240605;
        b=clkaKmW/h2xq+u7N2dXeFXrGP8CJ+G2UCqTKNvvn0h3QwziTRnIzeauuQnFA30VyMW
         CLwitvPv5gOom/z4RKR6QCv19UsaCjhZ6xyyzWNn78g6pAr735jDpv2zJzE9IZrjZASj
         +1OP9GD/rHhaNIBcPvhkkPSqJRzh2ih0/1Oo9d2QIFXq19ZzifmljHdlffvCxP72WLv+
         HTNfWaFKjflsEupk3FcwGBihzUhvzEWpKIJO7rL5Y/WUpDo/WKjTcwfqnhbAeSZ80gaa
         Bj3bVuvDj+8DU9dunBb5SVgSf1D4Qc/aCr219/MfFfPO9nZk/vsnqcqSiyCSDoUoiimr
         N8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=abJyJRaFyH8wiPErXc6KKJVQzQfU2n6SLiuYOQcRMlE=;
        fh=aCCexLyfLColBlQImWUWofG+M9WwT2cZngHbA2A8YGc=;
        b=Ki340LTU++AH8g6rmnbnuHMnQE1upIW+CtdLE8q4P4wNH7zpNViUc5MVKIDqo5ooaQ
         OXpIqSFDBMTB67syHph9MEv+uWx2cny3/f2OzqW9UAIPvLA+JHsM9szUDoIo8jWu+Fav
         EeJ9NoYD3en7hAnABveXr3IJn97kPZWjQJrGgkA7EN2Fz3T0yXwMNcp+rNKv6u6H5IUD
         RJuFWkNv1/ED7/OTcDWjheSeZGV/GZtfdlH5G+xKqRZvhk9DuIlXGgEJ0Z23C+IuB2GF
         h/fY/E58H8B7nmeLa5EoSqoP30Qh+wVbIjIM1FbVVHNMmFoTP1hQOQdq4UOhVPkn1py+
         7SXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773332991; x=1773937791; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abJyJRaFyH8wiPErXc6KKJVQzQfU2n6SLiuYOQcRMlE=;
        b=FRxp7o6PgyiNxXVwCsbjiqg3y68rorK+2y6quYOIUVMkGyaRxjJAi68DbG5Uzrw8cb
         3Il1KpvK5wA+2oWAolgzb/9J++EsW/08Yv7p1au035Cixd3Ek0naxJAnpHDi6e0v6zbj
         w3NKjRTjWJkvaG9cPkO02vWM9srLolDuJrZpiqZyr4FeszIbJsFlrDCiVlg1rpJjiZbt
         XDkvPSUHttwwZFKiHnfoQM1hHioEC6sxCZZ6zodmrUIJpQCzIwrOlOr1AAYFYJtpvzKs
         39PXVqxFF6uS35gvzCJsgPxV4BaUrJZDgK98ipN2N4rh+NMymBMsoqcsQlB9uYNLcQg5
         Z63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773332991; x=1773937791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=abJyJRaFyH8wiPErXc6KKJVQzQfU2n6SLiuYOQcRMlE=;
        b=td4qdNDZUeeyRh3az3qkbeMk2FY3PfD99Q0TfuPX3ziCWI/bAX103BTlgsZMzvfpSS
         DexyW33dKyL21tq+WSU0CW1/zIfYTPLUztQAkqKyJQGS7fO0zRbhKS/0qzKHQd78N5sz
         enykwM5VBmb92Pxc2dLVmKF3uqY0dWtglK6sAefVgqPMoBt+d2JUV2QeWv0nWwTf4QNB
         ygX6dm7FOQRqHqBdSSB4xmPiJLMq2OsGASveJNWZwaGXqreuWz/lQnriMcuVj/6t30UD
         koFyJd3CsgN1I53xJFTfj7FIGrbE96dYKQ+ORLUD6Uuu0+8GTXOy/reV373LpWCUCfQg
         O/jQ==
X-Gm-Message-State: AOJu0YzXBOrgUHMrj+BXl6CcMw0cS3fUhxfY9JNcMa18jINaIiyYaO4y
	kWqmgwjm083n6zXg0Nlu6BagvAJUFVkVTOG6xOrACZ7oHJ8IFkBOMILWMHCuJCtWzX3wf4Ki53D
	AtPsyHNN6+3gSKMlrY6N7iPNy3jHCdqM=
X-Gm-Gg: ATEYQzxOxUDB1SxjjfEVWIkLX6liPLiMfvoRxwLSGkTzuEvRm0+XYmp9Fpdwiab1F3a
	tDaKGEzCnfL7N6wjZlsJg+o0nSMte53/ctpa/3IS/E8T7I84wqZ+HflzSy89UptuwAmUIoha6me
	ky1JC4N7mhD/TphgrjY0oeN268HaEdteo9w7lpazAeu8CB014KG3MsslUgtckZi7nufiHcehh2y
	WpMJO+eygtR2XPxAnaz6fAFIWn1NZh+nqazzvaV5JS11RcFIhWpdaT49exPTWBBTeqRUifkrwr/
	mx1+RQV6oPJHNZziNG/cqPgKTbB6BY34/fSUm2vuAJw14i5GBZVSppTJK68XHK0=
X-Received: by 2002:a05:690c:81:b0:798:5333:ce25 with SMTP id
 00721157ae682-79a1c0dd510mr2175737b3.17.1773332990883; Thu, 12 Mar 2026
 09:29:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+tjKGrmADg=oG9CT74_mgGNN3h17=LLmnv51K=MggAqo7q2Eg@mail.gmail.com>
 <2026030839-applied-prominent-b774@gregkh> <CA+tjKGoWW70TRw6C+PMDbhpCh5P_jyJ9ciY3HckJystb+X26Mw@mail.gmail.com>
 <b3d8717f-07f7-4921-8808-55db94dfdc2e@leemhuis.info> <DM6PR12MB4354705B31704E35F281C5AA8744A@DM6PR12MB4354.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4354705B31704E35F281C5AA8744A@DM6PR12MB4354.namprd12.prod.outlook.com>
From: hgfdgjn <shichuanyim@gmail.com>
Date: Fri, 13 Mar 2026 00:28:38 +0800
X-Gm-Features: AaiRm52IBoideGAVT25vO2-eOHfN-ZnyfhEX3UoEXepaFuzbtZ5hi1fYF_r5iCA
Message-ID: <CA+tjKGqCmTQkxmdzrUfBxyENkMzocic1+OKS2bka5taGoy3SnQ@mail.gmail.com>
Subject: Re: [BUG] HDMI monitor shows no signal when the refresh rate is
 higher than the default 60Hz
To: "Vojvodic, Relja (Reggie)" <Relja.Vojvodic@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	"Koenig, Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>, "Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The populate_hdmi_info_from_connector() patch is in the stable master
and running on my device.
It appears to be a specific monitor issue.

This is the EDID of the monitor I used to reproduce the issue.

$ cat /sys/class/drm/card1-HDMI-A-1/edid | base64
AP///////wAhY0MkAAAAACQjAQOANR14Loy1r09DqyYOUFSlSwCBgLMAlQABAQEBAQEBAQEBAjq=
A
GHE4LUBYLEUADyghAAAeAAAA/AAyNEZTMQogICAgICAgAAAA/QAwkB6lKAAKICAgICAgAAAA/wA=
w
MDAwMDAwMDAwMDAxAe4CAyKxSJAEAwESHxM/aAMMABAAOHgA4gB/aBoAAAEBMJDtim+AoHA4QEA=
w
IDUADyghAAAeKIOAoHA4KUAwIDUADyghAAAeAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
A
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA6Q=3D=3D
$ cat /sys/class/drm/card1-HDMI-A-1/edid | parse-edid
Checksum Correct

Section "Monitor"
    Identifier "24FS1"
    ModelName "24FS1"
    VendorName "HKC"
    # Monitor Manufactured week 36 of 2025
    # EDID version 1.3
    # Digital Display
    DisplaySize 530 290
    Gamma 2.20
    Option "DPMS" "true"
    Horizsync 30-165
    VertRefresh 48-144
    # Maximum pixel clock is 400MHz
    #Not giving standard mode: 1280x1024, 60Hz
    #Not giving standard mode: 1680x1050, 60Hz
    #Not giving standard mode: 1440x900, 60Hz

    #Extension block found. Parsing...
#WARNING: I may have missed a mode (CEA mode 63)
    Modeline     "Mode 8" +hsync +vsync
    Modeline     "Mode 0" +hsync +vsync
    Modeline     "Mode 1" 148.500 1920 2008 2052 2200 1080 1084 1089
1125 +hsync +vsync
    Modeline     "Mode 2" 74.250 1280 1390 1420 1650 720 725 730 750
+hsync +vsync
    Modeline     "Mode 3" 27.027 720 736 798 858 480 489 495 525 -hsync -vs=
ync
    Modeline     "Mode 4" 25.200 640 656 752 800 480 490 492 525 -hsync -vs=
ync
    Modeline     "Mode 5" 27.000 720 732 796 864 576 581 586 625 -hsync -vs=
ync
    Modeline     "Mode 6" 148.500 1920 2448 2492 2640 1080 1084 1089
1125 +hsync +vsync
    Modeline     "Mode 7" 74.250 1280 1720 1760 1980 720 725 730 750
+hsync +vsync
    Modeline     "Mode 9" +hsync +vsync
    Option "PreferredMode" "Mode 8"
EndSection


This is another physically damaged monitor of mine, but I couldn't
reproduce this issue.
EDID for broken monitor:

$ cat /sys/class/drm/card1-HDMI-A-1/edid | base64
AP///////wBBDB/C+yUAACIfAQOAPCJ4KivFrVBHpiYTUFS/7wDRwIGAMWgxfEVoRXxhaGF8Vl4=
A
oKCgKVAwIDUAVVAhAAAeQOcAaqCgZ1AIIJgEVVAhAAAaAAAA/ABQSEwgMjc1TTgKICAgAAAA/QA=
w
kB7mPAAKICAgICAgAasCAzDxTBAfBRQEEwMSAhEBPyMJBweDAQAAZQMMABAAZ9hdxAF4gABoGgA=
A
AQEwkOZvwgCgoKBVUDAgNQBVUCEAAB5aoACgoKBGUDAgNQBVUCEAAB4COoAYcTgtQFgsRQBVUCE=
A
AB7wPADQUaA1UGCIOgBVUCEAABwAAAAAAAAA/Q=3D=3D

If you need other information or testing, please ping me, and I will test A=
SAP.

Thinks.

Vojvodic, Relja (Reggie) <Relja.Vojvodic@amd.com> =E4=BA=8E2026=E5=B9=B43=
=E6=9C=8812=E6=97=A5=E5=91=A8=E5=9B=9B 23:14=E5=86=99=E9=81=93=EF=BC=9A
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi,
>
> I've brought up this issue with some maintainers on our team and we've be=
gun looking into it.
>
> This issue has come up before and was fixed with this patch: "drm/amd/dis=
play: Improve HDMI info retrieval", which should be included in the stable =
master branch. You can double check if this is the case.
>
> In the meantime, could we get the EDID of your display to aid in the debu=
gging?
>
> Thanks,
> Relja
>
> ________________________________
> From: Linux regression tracking (Thorsten Leemhuis) <regressions@leemhuis=
.info>
> Sent: Thursday, March 12, 2026 9:33 AM
> To: Vojvodic, Relja (Reggie) <Relja.Vojvodic@amd.com>
> Cc: regressions@lists.linux.dev <regressions@lists.linux.dev>; Koenig, Ch=
ristian <Christian.Koenig@amd.com>; hgfdgjn <shichuanyim@gmail.com>; Deuche=
r, Alexander <Alexander.Deucher@amd.com>
> Subject: Re: [BUG] HDMI monitor shows no signal when the refresh rate is =
higher than the default 60Hz
>
> On 3/8/26 10:56, hgfdgjn wrote:
> > 7.0-rc2 can also reproduce it; after locating the issue, it was
> > reproduced using the stable upstream master branch.
>
> CCing the amdgpu maintainers, as this seems stalled. Dropping Greg and
> stable, they most likely don't care.
>
> Relja Vojvodic, in case you missed it: this regression seems to be
> caused by a commit of yours: 3471b9a31ce352 ("drm/amd/display: Rework
> HDMI data channel reads") [v6.19-rc1]
>
> Ciao, Thorsten
>
> >> On Sun, Mar 08, 2026 at 05:42:39PM +0800, hgfdgjn wrote:
> >>> Hi maintainers:
> >>>
> >>>   After updating to v6.19.6 on Arch Linux, if I set the refresh rate
> >>> higher than 60Hz, the monitor displays "No Signal".
> >>> I tried bisecting and found:
> >>>> # first bad commit: [3471b9a31ce352ffb343cf02a991261880aac3a7] drm/a=
md/display: Rework HDMI data channel reads
> >>>
> >>> This issue on my machine was caused by this change:
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> >>> b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> >>> index 267180e7bc48..5d2bcce2f669 100644
> >>> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> >>> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> >>> @@ -549,7 +549,8 @@ void write_scdc_data(struct ddc_service *ddc_serv=
ice,
> >>>      /*Lower than 340 Scramble bit from SCDC caps*/
> >>>
> >>>      if (ddc_service->link->local_sink &&
> >>> -        ddc_service->link->local_sink->edid_caps.panel_patch.skip_sc=
dc_overwrite)
> >>> +        (ddc_service->link->local_sink->edid_caps.panel_patch.skip_s=
cdc_overwrite
> >>> ||
> >>> +        !ddc_service->link->local_sink->edid_caps.scdc_present))
> >>>          return;
> >>>
> >>>      link_query_ddc_data(ddc_service, slave_address, &offset,
> >>>
> >>>
> >>> It appears that scdc_present is always false on my device.
> >>> I reverted the change to write_scdc_data(), and the monitor works
> >>> normally at high refresh rates.
> >>
> >> Can you cc: the developers and maintainers of this change to let them
> >> know?  Otherwise they will not notice it.  Also, does 7.0-rc2 show thi=
s
> >> issue?
> >>
> >> thanks,
> >>
> >> greg k-h
> >
>
