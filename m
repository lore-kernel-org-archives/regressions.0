Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE6233E367
	for <regressions@lists.linux.dev>; Sun, 30 Aug 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788100921; cv=pass; b=BSKCYwBitZGSwlpXBVaI3WHaUANio0yqqXsv1MfwcOhg2SszDJy0aPDoQg0BGUfxrgMZeRcTf9CCJYwoDM7DIWtw8/0S7RS6eNShzA1V8sU0JfYCw3HNfso9VzY90F2FKvWzOxdRRuqeF2Y3QM2oSD7ZEMTKelfjXNzxhsyJkGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788100921; c=relaxed/simple;
	bh=1EKpfNX509NAcA59LbrSCuzxDKgr6ESuiyJW4nYMZtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOco0eVOirNcUzDX9Np3CeQ35U81pY8riXfScpcjKnuspKumTz2RpwJQOQ8ZMEvbW039NT16D8g8PRvznVn59UZVHz08dxpCYMKq5QbE9iMJRFdnipW15j4HaEsXMPTbAaAOg8Z3YUFDTuJo+6fdNAdL7aIPZExO8AYZrZzrJ6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ut11yUUY; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ut11yUUY"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-52fa9c055b5so35378441cf.1
        for <regressions@lists.linux.dev>; Sun, 30 Aug 2026 07:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788100919; cv=none;
        d=google.com; s=arc-20260327;
        b=WmpykY7JxTOBBLq56DMAkmBtrqcBDTHJS0I8ohC0lEy6MlNp8QcKT8brZbn+w1mdKL
         gfSeioI4gwxzY0AvnGTTDARwFgKsyve14MFYIuGeSFNotK7Ly8B+wzvzHxq38ZOfPFZV
         CKrTjDFgmKlthfHnpAqlNqWtbehHZ0lHzcT2Q6+IeRTVlV/iVNgRPnakBa9beYyluJo9
         6sQumpFvwi+j10uKnidtNx9jQWch0amLs5vAk04bdcPidjFhGMyAtjMczP4e7b74tDyk
         kcq+IsjDnPlWW1d2LvDhMqo91zlLU0zQaSQ3ZEDw+o+dsL3cwvwYi3vnSp/FK76vJkQR
         +tEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1EKpfNX509NAcA59LbrSCuzxDKgr6ESuiyJW4nYMZtE=;
        fh=At8pJ/NS+X2hzUtQDWY/8eDuyxrr3WwKF1SZivZnaaA=;
        b=qBQT61tHnrkBf0OfDu0ZjahL+WoLM78L/7f4ACpws85+zHaiBogGArkm+hsmdpVXUc
         TUANvoPhw36Jki1FhZ3qg59akJ6/aj/KK4OQgJbGM9ROCm4dEj0PtN6L8DO+NE6+DNoG
         xoLvPznJ65Rbi9FfExVZDH+TzRfUKioM5Uw3PrIaAQnN5te0B5m/De/XckepIR2U6+5q
         Szl6sBlpbCy6DrPz8EeHU82eTM/1pqzdxZTGXMeRtfeawqRvi3OC1kxnARhVckMSVkl3
         rUnAZW1tFid8UTGalY0dKaLzYCbjS1g2YTZgdZg/M1zC4gq4kIje/P39B1DhDV2BI5Xr
         KWfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788100919; x=1788705719; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EKpfNX509NAcA59LbrSCuzxDKgr6ESuiyJW4nYMZtE=;
        b=Ut11yUUYxnH9u3/R2I1lyw0/qFGNVhg0EQwx7TGcqH+q7n2b5pgoF6XSNW4+V+feMw
         TMV7YZKMB9JJ2PjBEgooRPBTjQMTyxop1O7E/CnlrXqTO2jDnNCpU5AWEq8Z256f8LJX
         37Yv41jrKk+wAaMQBzf00le2/WdboQnLsJ01MiyhLnTxbueAXXJwB5RhTBOMW5OMxs4H
         sAtvW3ws6aQFVV2hQ09WlskeuF1xARKsoht+SOjpymPS3dTZApn0iw5Q5XJMZXqG/g5l
         mooLPpR2slufagaXJWRaJJd4AelTpk3VZ3Bq8WDwixWLs/340hZbYenupFxI6gTxs6SK
         rHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788100919; x=1788705719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1EKpfNX509NAcA59LbrSCuzxDKgr6ESuiyJW4nYMZtE=;
        b=H5a+8zTPK/RDQlP9o7KapHlxx8gpmRq0EXyaW/XA7LzXBPmOMV5Toxt1+DwauMs/I2
         ajdx33YV+e/+QfbNZ1zophw3Bxpf2XPvrMOtn9PAoawyZROrp8tX8FPGDeDGlLiUEcpp
         tmL0Nz8nhGsuM1uByVnW1hBWUeSGLHJoneFGZ/mxCG2jA2SoClc8OZJm9CnJ7xEVxvXP
         bQE90GEGGHeB94sbeH1YJuV8YHmSrXXYCHLOyJsBXxdaGaOStRlL4Gjbro18Mj2JP6Co
         t5zEJtQ3/DfMZM09zkGwumpuX+APNLizZ+Oc+7oynMdM7r5Hvlc1k5Eepk0P25hGhWdd
         uqdA==
X-Forwarded-Encrypted: i=1; AHgh+RqvX9J6d/8d2JMvFlsxqgSziqs56kflyDflMMDlFMNgvPHucqVv91zTu6Bczf39a9JMLoaML/6yD8yyHA==@lists.linux.dev
X-Gm-Message-State: AFuF++mPXjwEnoc5V5dML2NakBJ4zdjYDZ6UrpdNj0U4RBk57rLNdG5N
	eBgmFd8cVtV8cv6os6E7HdiregFsISvYVhAH6hehyyWb9geZRtIqmw952ruWqbCMl9nX4EiBv53
	2iQerXa4y/rYPdh8Km9LgK6U8LaeWPn4=
X-Gm-Gg: AR+sD11vSSACbqhSScarsL289HzjzEEXySQZrnANZtwYYwfTU2FUOXZ/fZunLvqKfD/
	PaFNmG4L+neCORNa6YIzP0n7hG+pixbGxWRWw2XwMysCuiTolOjBuH/Qy1GvOazTagRujyD6DAD
	HDLK84g+ejgyAtqu8dvgBlS8xpLMpE94DrYSpaYxr4sdr2IL76aacJ3VQ/F/Wn2NBoRI+wEkH9g
	7fl595LpUP2/YGDn19/UM3z5bhyj9q1VpTQHu5RUUftRxPdglZpVfFEVP5aRrP95T8+vB4/BsOj
	srVfDPqjXBkmTnrR+hqxzEa3UzmPVJvEFG1sHctQT/nNuLnokSipDIctQJi7cQhs
X-Received: by 2002:a05:620a:2991:b0:936:af34:468e with SMTP id
 af79cd13be357-93936bcb3admr243073685a.4.1788100919120; Sun, 30 Aug 2026
 07:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <178806598504.23591.11490486941444891398.reportbug@localhost>
 <178807922598.807847.18300931641658404390@eldamar.lan> <ac830f9d-ea86-4f49-b88b-9aa8a09015c0@gmx.de>
 <CAL2p-7jB4LUEPhyBy2QjtK+Cn_hMBQ+ereWZryHpZ3JDJ_ZpPw@mail.gmail.com>
In-Reply-To: <CAL2p-7jB4LUEPhyBy2QjtK+Cn_hMBQ+ereWZryHpZ3JDJ_ZpPw@mail.gmail.com>
From: Mo Jun <royclark086@gmail.com>
Date: Sun, 30 Aug 2026 22:41:46 +0800
X-Gm-Features: AcwNN1WQigLhzHYMImI_yaaj0penJs2Fw872JT4mNKejiAeGOR1zlQRiow_gi2k
Message-ID: <CAL2p-7hqJOfzLuuXF0b=H1zAzirp4UN+Ty59W2F34PCAdstMsw@mail.gmail.com>
Subject: Re: asus-laptop: Fn hotkeys no longer work on ThinkPad SL400 after
 378500dc1313 ("platform/x86: asus-laptop: Register ACPI notify handler directly")
To: Armin Wolf <W_Armin@gmx.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1146124@bugs.debian.org, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Denis Benato <denis.benato@linux.dev>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="0000000000001b75af065a44b030"

--0000000000001b75af065a44b030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin Wolf,

On Sun, Aug 30, 2026 at 9:26=E2=80=AFPM Mo Jun <royclark086@gmail.com> wrot=
e:
>
> Hi Armin Wolf,
>
> On Sun, Aug 30, 2026 at 7:59=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
> >
>> [...]
> >
> > I think i found the culprit, could you please test the attached patch?
>
> Build the module with the patch(only "make -C .
> M=3Ddrivers/platform/x86") and load the built
> drivers/platform/x86/asus-laptop.ko, now the Fn hotkeys works again.

I found that after rmmod the built module, it can not be insmod again.
Also the system experienced NULL pointer dereferences in
acpi_bus_generate_netlink_event() which may related to the built
module.

I guess these was caused that the patch only change calling to
acpi_dev_install_notify_handler(), not
acpi_dev_remove_notify_handler().
After change ACPI_DEVICE_NOTIFY to ACPI_ALL_NOTIFY in calling to
acpi_dev_remove_notify_handler()(see attached patch), now the module
can be insmod again after once rmmod.

Regards,
Jun MO

--0000000000001b75af065a44b030
Content-Type: application/x-patch; name="asus-laptop.patch"
Content-Disposition: attachment; filename="asus-laptop.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mtfwyujb0>
X-Attachment-Id: f_mtfwyujb0

LS0tIGRyaXZlcnMvcGxhdGZvcm0veDg2L2FzdXMtbGFwdG9wLmMub3JpZwkyMDI2LTA4LTI4IDE0
OjI1OjIyLjAwMDAwMDAwMCArMDgwMAorKysgZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1cy1sYXB0
b3AuYwkyMDI2LTA4LTMwIDIyOjIwOjUxLjQ3ODU2NTg2MSArMDgwMApAQCAtMTg4Nyw3ICsxODg3
LDcgQEAKIAlpZiAocmVzdWx0ICYmIHJlc3VsdCAhPSAtRU5PREVWKQogCQlnb3RvIGZhaWxfcGVn
YV9yZmtpbGw7CiAKLQlyZXN1bHQgPSBhY3BpX2Rldl9pbnN0YWxsX25vdGlmeV9oYW5kbGVyKGRl
dmljZSwgQUNQSV9ERVZJQ0VfTk9USUZZLAorCXJlc3VsdCA9IGFjcGlfZGV2X2luc3RhbGxfbm90
aWZ5X2hhbmRsZXIoZGV2aWNlLCBBQ1BJX0FMTF9OT1RJRlksCiAJCQkJCQkgYXN1c19hY3BpX25v
dGlmeSwgYXN1cyk7CiAJaWYgKHJlc3VsdCkKIAkJZ290byBmYWlsX3BlZ2FfcmZraWxsOwpAQCAt
MTkxNyw3ICsxOTE3LDcgQEAKIHsKIAlzdHJ1Y3QgYXN1c19sYXB0b3AgKmFzdXMgPSBwbGF0Zm9y
bV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAotCWFjcGlfZGV2X3JlbW92ZV9ub3RpZnlfaGFuZGxlcihh
c3VzLT5kZXZpY2UsIEFDUElfREVWSUNFX05PVElGWSwKKwlhY3BpX2Rldl9yZW1vdmVfbm90aWZ5
X2hhbmRsZXIoYXN1cy0+ZGV2aWNlLCBBQ1BJX0FMTF9OT1RJRlksCiAJCQkJICAgICAgIGFzdXNf
YWNwaV9ub3RpZnkpOwogCWFzdXNfYmFja2xpZ2h0X2V4aXQoYXN1cyk7CiAJYXN1c19yZmtpbGxf
ZXhpdChhc3VzKTsK
--0000000000001b75af065a44b030--
