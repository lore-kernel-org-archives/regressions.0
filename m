Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B8479B7E
	for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 07:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720595023; cv=none; b=LIHbJIkLXXRYUGuRAkLt3qXiLfjiq172aUKeBowo9HhUTqV6A7XItqJrNNR0hzxFCqhkj3+B3fEpeVbdBt/H6SgUCw9M0TY7CAT+QwttZ/eR8CEgfT7YdySt9xScDb7wGXXiN5J0jFEMSjfGUhDeYPv5cQIWnPo1076Lj7qCF8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720595023; c=relaxed/simple;
	bh=p3BXcqkjeuhZC3iXU7hUkrYXvkUrW95a4kWlrA8Wcs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plH/vTvZBEQ5hzx6yZKUh/lefujy8XwaJ27zP61nudkajdGPsHyQptdvmpSQ4acvkxiYxZJXLFo8hpCwIIa2Rjk4Wy/JeYOLB7ScOmTO32psC+T6zLQZubDTYfNRmpSaUs/kn6NmH0+VVUCgNe0RPT6RQz84qENd/7HM5AKjA7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTW31QXQ; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTW31QXQ"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-447e221150cso1603131cf.3
        for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 00:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720595021; x=1721199821; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3BXcqkjeuhZC3iXU7hUkrYXvkUrW95a4kWlrA8Wcs0=;
        b=BTW31QXQ1N+PHL6sq3Iku4JpGg+diDVqjYqJtUPwgxB77FfS5mKuu3Gb4bqWjJnc3/
         utS/tZ+br2PfSTek2MV3yKgYvp3eThl9pgJTWIQLSjsU+irBCnliVJNbhJFA8UziNZuc
         GwqbLQi57I/38BTOfT2Ga+cldDrvYID4DyL5DljgnytW4fp/Fjltk2BXbOc5Vrwp3mZ2
         eJW/xo6r731bIg2ypenPbljonf9vKaDm5c2WSGfGeFCi+bSggZwrsWmcsoZuTQjk/0N1
         T2ArGQ3uv2HhWeSPY9OK1el2VXyFon2AlDlOZC5NOf8DPXY4pZPlbx0fl/y7/a9k9jnl
         DH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720595021; x=1721199821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3BXcqkjeuhZC3iXU7hUkrYXvkUrW95a4kWlrA8Wcs0=;
        b=JoZa9Xfg/0iYdJw7NEAl2HxORzCUt+fSP6k3NZ8GBJqXa9yoEIF5GRCbS+nVxGvimD
         Cr/ZNFNzgZBf5Pls7rsK3fmHcTydRBSsJdyqsgg/0KkwsUGuxeDYiCv+pdjt0+jx7LXE
         j2WQtuK0AKFvUvL5TaPQYAd0MIZgAr39GZXaBYKI2gxXBNcQ5jE5To2IIP68Tqiql0RZ
         GWgemUhPoUXW6Hrks/ieuy6edH/WWU5oIxRH8PNQ0Y04gjuG+1Uolq9g780k9Z9zwP93
         Sb8slkertqdgrnDrfUthjKX4ViVqeLPdT4BYzejDf0SRV8Xn5hQkQ3+rGaTyfF5a+s9T
         yACA==
X-Forwarded-Encrypted: i=1; AJvYcCX0rOfQPy0jgF69JCuVOHf3A3ge9eem2ZTeK4CLU54QdEbHovMJrlVNybU1yXjb1VBXQfSvhuhRyt8Ff4hiIiZc3yiJCjHG4tpn+rU=
X-Gm-Message-State: AOJu0YyPk+zSoClkBzPapCxTIPbS18qa2zIkgmfmZKoY6c23zqjuqXSj
	gOzzfVqsk+Lq67Yftv2BMQfdXGTLwO7EQJsTjVqDSPscj5Ak4e+4hNgVGw4UJKV9L8dku6NBM4x
	4Htz2fgIH2H8I8fDCDEN52X5cY/E=
X-Google-Smtp-Source: AGHT+IGoTFtKJW2jS7acG2Oi3QXPtRAexd48mCUJWxKk2iudODVVH1vr9AaGCM32ITeGQ3dDowuFjyKpv2ALtupjw7I=
X-Received: by 2002:a05:6214:514d:b0:6b2:b13d:5b75 with SMTP id
 6a1803df08f44-6b61bc801a7mr50698376d6.1.1720595021031; Wed, 10 Jul 2024
 00:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info> <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
 <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com> <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
 <2915a8c4-ebac-4dae-8f09-32a5b4d9aeda@amd.com> <CABXGCsPuRViSd_WeOciLKcQ4hjYxJ7e3i7LomwsUMzd0a+zvBw@mail.gmail.com>
In-Reply-To: <CABXGCsPuRViSd_WeOciLKcQ4hjYxJ7e3i7LomwsUMzd0a+zvBw@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 10 Jul 2024 12:03:30 +0500
Message-ID: <CABXGCsOsfP2SToiDhRAS51nPJ+Qr2v7B3Kjr+yVeP4G7zFZpMA@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 12:01=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> On Tue, Jul 9, 2024 at 7:48=E2=80=AFPM Rodrigo Siqueira Jordao
> <Rodrigo.Siqueira@amd.com> wrote:
> > Hi,
> >
> > I also tried it with 6900XT. I got the same results on my side.
>
> This is weird.
>
> > Anyway, I could not reproduce the issue with the below components. I ma=
y
> > be missing something that will trigger this bug; in this sense, could
> > you describe the following:
> > - The display resolution and refresh rate.
>
> 3840x2160 and 120Hz
> At 60Hz issue not reproduced.
>
> > - Are you able to reproduce this issue with DP and HDMI?
>
> My TV, an OLED LG C3, has only an HDMI 2.1 port.
>
> > - Could you provide the firmware information: sudo cat
> > /sys/kernel/debug/dri/0/amdgpu_firmware_info
>
> > sudo cat /sys/kernel/debug/dri/0/amdgpu_firmware_info
> [sudo] password for mikhail:
> VCE feature version: 0, firmware version: 0x00000000
> UVD feature version: 0, firmware version: 0x00000000
> MC feature version: 0, firmware version: 0x00000000
> ME feature version: 38, firmware version: 0x0000000e
> PFP feature version: 38, firmware version: 0x0000000e
> CE feature version: 38, firmware version: 0x00000003
> RLC feature version: 1, firmware version: 0x0000001f
> RLC SRLC feature version: 1, firmware version: 0x00000001
> RLC SRLG feature version: 1, firmware version: 0x00000001
> RLC SRLS feature version: 1, firmware version: 0x00000001
> RLCP feature version: 0, firmware version: 0x00000000
> RLCV feature version: 0, firmware version: 0x00000000
> MEC feature version: 38, firmware version: 0x00000015
> MEC2 feature version: 38, firmware version: 0x00000015
> IMU feature version: 0, firmware version: 0x00000000
> SOS feature version: 0, firmware version: 0x00000000
> ASD feature version: 553648344, firmware version: 0x210000d8
> TA XGMI feature version: 0x00000000, firmware version: 0x00000000
> TA RAS feature version: 0x00000000, firmware version: 0x00000000
> TA HDCP feature version: 0x00000000, firmware version: 0x1700003f
> TA DTM feature version: 0x00000000, firmware version: 0x12000016
> TA RAP feature version: 0x00000000, firmware version: 0x00000000
> TA SECUREDISPLAY feature version: 0x00000000, firmware version: 0x0000000=
0
> SMC feature version: 0, program: 0, firmware version: 0x00544fdf (84.79.2=
23)
> SDMA0 feature version: 52, firmware version: 0x00000009
> VCN feature version: 0, firmware version: 0x0311f002
> DMCU feature version: 0, firmware version: 0x00000000
> DMCUB feature version: 0, firmware version: 0x05000f00
> TOC feature version: 0, firmware version: 0x00000007
> MES_KIQ feature version: 0, firmware version: 0x00000000
> MES feature version: 0, firmware version: 0x00000000
> VPE feature version: 0, firmware version: 0x00000000
> VBIOS version: 102-RAPHAEL-008
>

I forgot to add output for discrete GPU:

> sudo cat /sys/kernel/debug/dri/1/amdgpu_firmware_info
[sudo] password for mikhail:
VCE feature version: 0, firmware version: 0x00000000
UVD feature version: 0, firmware version: 0x00000000
MC feature version: 0, firmware version: 0x00000000
ME feature version: 44, firmware version: 0x00000040
PFP feature version: 44, firmware version: 0x00000062
CE feature version: 44, firmware version: 0x00000025
RLC feature version: 1, firmware version: 0x00000060
RLC SRLC feature version: 0, firmware version: 0x00000000
RLC SRLG feature version: 0, firmware version: 0x00000000
RLC SRLS feature version: 0, firmware version: 0x00000000
RLCP feature version: 0, firmware version: 0x00000000
RLCV feature version: 0, firmware version: 0x00000000
MEC feature version: 44, firmware version: 0x00000076
MEC2 feature version: 44, firmware version: 0x00000076
IMU feature version: 0, firmware version: 0x00000000
SOS feature version: 0, firmware version: 0x00210e64
ASD feature version: 553648345, firmware version: 0x210000d9
TA XGMI feature version: 0x00000000, firmware version: 0x2000000f
TA RAS feature version: 0x00000000, firmware version: 0x1b00013e
TA HDCP feature version: 0x00000000, firmware version: 0x1700003f
TA DTM feature version: 0x00000000, firmware version: 0x12000016
TA RAP feature version: 0x00000000, firmware version: 0x07000016
TA SECUREDISPLAY feature version: 0x00000000, firmware version: 0x00000000
SMC feature version: 0, program: 0, firmware version: 0x003a5a00 (58.90.0)
SDMA0 feature version: 52, firmware version: 0x00000053
SDMA1 feature version: 52, firmware version: 0x00000053
SDMA2 feature version: 52, firmware version: 0x00000053
SDMA3 feature version: 52, firmware version: 0x00000053
VCN feature version: 0, firmware version: 0x0311f002
DMCU feature version: 0, firmware version: 0x00000000
DMCUB feature version: 0, firmware version: 0x02020020
TOC feature version: 0, firmware version: 0x00000000
MES_KIQ feature version: 0, firmware version: 0x00000000
MES feature version: 0, firmware version: 0x00000000
VPE feature version: 0, firmware version: 0x00000000
VBIOS version: 113-D4120100-100


--=20
Best Regards,
Mike Gavrilov.
