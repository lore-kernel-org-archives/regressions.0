Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90ED347FD1
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377275; cv=pass; b=f4uwlqhZ4WohrHhmJ/MEyXb8VSPqVfvF9ZkOlNnlc5VQxy63bahsDLpg2ggDMs2gcjdHHD9uZcxncxT/wdt+oltfDYjxF84c+mduUU+b21jjyczCu8uzdb6MpHT7qfJB78RNGGyWclknC0tfWf28mmXA1lF0vysA1FPqar5CLTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377275; c=relaxed/simple;
	bh=drWmzhKwWcnfq8qAZ3RvMJ2nIsiaQDi+X2A3ftu8zHo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Z4mcIhlNUMH+pPrREqEPtuT2PeKbmE809yM7+Eujj4CaO+LyjFWTdMMe+UeuhJoMPQKJmf+Y+Im0yvNAZ4MqqbORVn0O3BwDv7X6vywDxOVqoOA9aQY4i0FtaPIX4pHxBfwrGd+gSVNqtzAHjZAGTcmNxxD+23/DJ4x8racjbzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeYUY00p; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeYUY00p"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4362cdf1d5aso363696f8f.0
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 03:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770377273; cv=none;
        d=google.com; s=arc-20240605;
        b=HsIBge21OT9QNWUv0rlLFPJiE+gblBq1R1YW9+Dj9OYPgHOi52KuHsiVmJZ8/OaTyt
         ENjW74h4GoZ3he4MeXJ0OiFsz2NvJChtkheppQllfFS8gzTOqVgjxNEYoevLVZ/pLe1w
         v/UWDHiDU5/4A+cm6P4mkoRb3tM11zSlC5Jd8lxhtmGYLj8AAKXqBARWlfalUAzK31KA
         Sl6P8QQeg58MtP+ym6X1x8Lv39mqmVG/NhBeRPgm0nuEP9M0JK2i/19UmX7EeLem0Bl6
         HoBCpLDAv/e9AfTn8Kdqifz0LIMoJAU8GM6CR3I/NdxLtEW7zzMNZnhIPvNVuJ7a5EtP
         yfeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8rpRn2fJApMdS6a/+IcQoJDLy1/dzYmKoOOKVNkFDso=;
        fh=wr4jRQkouhkhUa2jfLxPxEIhAzMGiuuK4Yrz1XAyqYY=;
        b=OtdskluMlT5OJStmo/D87zwg0js+qVeNEOuprQV+aTzhLiIo7ab/Fja/x+bglY1f4h
         tpGO58Vhm/27t0W6hlBrhpI2hbQ8Y3ZEYuPL31Jgrm9AuWvUTBXnkppp9Jf7P1DZQiqc
         ipCv8YQHXZ/DTteEqji9a/drSQLJOWLgA/FDV61QOA3NFIhm7LfaFWjkTVBENOHdww+z
         439MIx3JHXsY62pDmJ3yI1d9OMWD/mSZbqv24RLU+Ve0yUyy4HKC5T52uV+I4wfNt4l1
         RUMd9VliWEjVyHcwykaxKH4qU48jToky3mPw1knrYVsSYsTzVm38NOYDetYxwZAFru5e
         JbHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770377273; x=1770982073; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8rpRn2fJApMdS6a/+IcQoJDLy1/dzYmKoOOKVNkFDso=;
        b=UeYUY00p+q8qZfwEpWGDylp6sg5+iYJZ1mtDE3cTGAWgBEb4Ybb6VjsU9+8lIqP5e6
         yMoANzB6i1XI0GPDYpfhw+z2OBZ7DmVm5+OuRxir933WNePw+LnWgMkaEx68lSILpPzy
         DgP8jFgFeHt7HQVtWXz2rszBRl4be8f/QS8HIb+AU42HgP77otW/tUFZ4DYivmaEJDTr
         TY21Bgb9I4FinwMXbsx5J6swMj1meUzXWMtfrksBC6vO3nJ6WSOHcGVHji1VfxJPW8AF
         Dpk+Rsk9u9NSqVxeURZrqpuEfaxOZbTa2YfMFkfrvQC+fBA/dG1zn9rpTkSnPD/e9xXY
         o3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377273; x=1770982073;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rpRn2fJApMdS6a/+IcQoJDLy1/dzYmKoOOKVNkFDso=;
        b=ZI0XAHCtkINdcP88qYLQ0dbID+skJcsWzXh0B5HoEYELAEmkH2DwW1JROKvZflpBNe
         lgura48DpcJSGgCAusEhXk9L0+Iwq9/e1f9wSgs9ivnrEBKsrJeP+CbtBX7y7UdaqQ+x
         st21j0Iymy2i6IT2EVofOt0PbctOc7swi9XXQNuA9VeyMsj8RpQcLi42J5FN1+ZGqHxQ
         Rj85QAzl89bm+pS0FgS1sohunF2krr0ysWswyMVDIoR5wREaw5oML7BDmsB/yYoIs1rg
         NywyoteOfbr+vqdnhN8JcIkYPr7CztbpXi+NbN4WZlvk9WwfFLZIcfrY7W69pQTX/Pt2
         RkIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV45WhjnG0F/Bw7h8gJGuXyD/eiwdZHTxpLYEmo88FUywj3kJJPB9KafXmVyp0zYD7x1ARtWIm6GtCYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCQgaNdKq+lZAJBZPSkCb+5AfIbQA4njPj81w0rrIRWpMnJoL6
	wPY1GC/wXKAa9PtEWeJPvyGKpnG2GBF8BOCszaPBp6EHS+NOLTZfzkFvye1BL82TL3PQOnaxTUj
	Z3WdodKYo4v1xMYUF4n6VKoUdwRetwe4=
X-Gm-Gg: AZuq6aJJLijSun29oSlwcPijIvbXxaC0PrzufLshF1vH372mkYw3H/gOVCJiGrJbQ12
	5ZXqX7KLcOQxx31VmCY6ocaynkV1XknBu0cHzg4BYGwKlOBPYuhKYPNZONA+gIQ3DQussdshS03
	Y31U2UMBslXhrBlVWXgA9oZ21RKcz5AQRCqHKpxOqH7sGJlHLGwtpNmEl46wzigrFXUTaKJ+12B
	z3SE9+d5rj3XmeLf08Nu3VRzR0QPSUbRksdNgWlosThgs/46xQ/zkLt+cHbVZEWe+C5Z5hgT9z6
	WK/+32g=
X-Received: by 2002:a05:6000:240e:b0:436:1517:aeca with SMTP id
 ffacd0b85a97d-43629341e78mr3852965f8f.15.1770377272797; Fri, 06 Feb 2026
 03:27:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Denis Gessert <denisgessert@gmail.com>
Date: Fri, 6 Feb 2026 12:27:39 +0100
X-Gm-Features: AZwV_QhdcDjr2TR2bMvEIKOTcHsXgcWyk0olVALf1cizbsMi-tx34Ce4i_XNuG8
Message-ID: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: Thorsten Leemhuis <regressions@leemhuis.info>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Evans Jahja <evansjahja13@gmail.com>, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="00000000000076e466064a2614dd"

--00000000000076e466064a2614dd
Content-Type: multipart/alternative; boundary="00000000000076e465064a2614db"

--00000000000076e465064a2614db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I found this email chain while troubleshooting why my Levovo Duet (with the
MT8183 chip) would not boot using any 6.18.* kernel.

I can confirm that on my device the current stable 6.18.8 does not boot
unless I revert the commit

commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
Author: AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com>
<angelogioacchino.delregno@collabora.com>
Date:   Thu Jul 24 10:39:08 2025 +0200

    arm64: dts: mediatek: mt8183: Migrate to display controller OF graph

mentioned below. With the reverted commit the device boots as intended.

Cheers,

Denis


On 12/4/25 15:44, Thorsten Leemhuis wrote:

Lo!

Matthias, AngeloGioacchino, have you maybe looked into regression that
seems to be caused by 72d63fa0563f8 ("arm64: dts: mediatek: mt8183:
Migrate to display controller OF graph")?

Evans Jahja, just to be sure: I suppose it still happens with 6.18
final? And have you tried if reverting the change fixes this ("fix the
issue just by using the dts from the other version" might have changed
other things as well, that's why I'm asking)

Ciao, Thorsten

On 11/28/25 03:59, Evans Jahja wrote:

Hi,

There has been a regression in the dts for my system
mt8183-kukui-krane, where changes in dts/mediatek/mt8183.dtsi broke my
machine.

The display works under v6.17.9 but is broken in v6.18-rc7. I was able
to replicate / fix the issue just by using the dts from the other
version.


On Wed, Nov 26, 2025 at 3:01=E2=80=AFAM Evans Jahja <evansjahja13@gmail.com=
>
<evansjahja13@gmail.com> wrote:

Hi,

I have a Lenovo IdeaPad Duet Chromebook CT-X636F, detected as Mediatek
krane sku176 board. (mt8183-kukui-krane)

The display failed to initialize on the mainline kernel (linux
6.18-rc7). Using the same config, on stable (linux 6.17.9) the display
works fine.

config: https://bugzilla.kernel.org/show_bug.cgi?id=3D220803

With the system on mainline kernel, I was able to check the serial
console, the error on dmesg looks like this:

[    6.513400] mediatek-drm mediatek-drm.18.auto: Building display
pipeline for MMSYS 0
[    6.514983] mediatek-drm mediatek-drm.18.auto: Display HW Pipeline
built with 9 components.
[    6.515009] mediatek-drm mediatek-drm.18.auto: Invalid display hw
pipeline. Last component: 38 (ret=3D-2)
[    6.524422] mediatek-drm mediatek-drm.18.auto: probe with driver
mediatek-drm failed with error -22

Temporarily modifying mtk_drm_drv.c by commenting calls to
mtk_drm_of_ddp_path_build_one CRTC_EXT and CRTC_THIRD allows the
display to function even on mainline. I was also able to add some
logging and determine that building the HW pipeline for CRTC_MAIN
works, but because building CRTC_EXT fails, the entire display would
not initialize.


I think this is the issue:https://lkml.org/lkml/2025/9/12/1242

On Wed, Nov 26, 2025 at 2:06=E2=80=AFPM Evans Jahja <evansjahja13@gmail.com=
>
<evansjahja13@gmail.com> wrote:

Hi Angelo, I was able to isolate the problem further to the dts. After
bisecting the arch/arm64/boot/dts/mediatek/ and building the dts, it
seems like this is the first commit that introduced the issue on my
device.

commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
Author: AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com>
<angelogioacchino.delregno@collabora.com>
Date:   Thu Jul 24 10:39:08 2025 +0200

    arm64: dts: mediatek: mt8183: Migrate to display controller OF graph

I am linking my full bisect log here:
https://bugzilla.kernel.org/attachment.cgi?id=3D308962&action=3Dedit

where we're unconditionally adding mmsys_ep_ext.

The issue seems to be caused by the recent addition of CRTC_EXT on the
base mt8183

Please kindly take a look. Apologies for any mistake, this is my first issu=
e.

Evans Jahja

--00000000000076e465064a2614db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><u></u>

 =20
   =20
 =20
  <div>
    <p>Hi,</p><p>I found this email chain while troubleshooting why my Levo=
vo Duet (with the MT8183 chip) would not boot using any 6.18.* kernel.=C2=
=A0</p><p>I can confirm that on my device the current stable 6.18.8 does no=
t boot unless I revert the commit</p><pre>commit e72d63fa0563f8a6e98c10fed3=
a9ce74dc0536e6 (HEAD)
Author: AngeloGioacchino Del Regno <a href=3D"mailto:angelogioacchino.delre=
gno@collabora.com" target=3D"_blank">&lt;angelogioacchino.delregno@collabor=
a.com&gt;</a>
Date:   Thu Jul 24 10:39:08 2025 +0200

    arm64: dts: mediatek: mt8183: Migrate to display controller OF graph<br=
></pre><pre>mentioned below. With the reverted commit the device boots as i=
ntended. <br><br></pre><pre>Cheers,<br></pre><pre>Denis</pre><p><br></p>
    <div>On 12/4/25 15:44, Thorsten Leemhuis
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>Lo!

Matthias, AngeloGioacchino, have you maybe looked into regression that
seems to be caused by 72d63fa0563f8 (&quot;arm64: dts: mediatek: mt8183:
Migrate to display controller OF graph&quot;)?

Evans Jahja, just to be sure: I suppose it still happens with 6.18
final? And have you tried if reverting the change fixes this (&quot;fix the
issue just by using the dts from the other version&quot; might have changed
other things as well, that&#39;s why I&#39;m asking)

Ciao, Thorsten

On 11/28/25 03:59, Evans Jahja wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>Hi,

There has been a regression in the dts for my system
mt8183-kukui-krane, where changes in dts/mediatek/mt8183.dtsi broke my
machine.

The display works under v6.17.9 but is broken in v6.18-rc7. I was able
to replicate / fix the issue just by using the dts from the other
version.

</pre>
        <blockquote type=3D"cite">
          <pre>On Wed, Nov 26, 2025 at 3:01=E2=80=AFAM Evans Jahja <a href=
=3D"mailto:evansjahja13@gmail.com" target=3D"_blank">&lt;evansjahja13@gmail=
.com&gt;</a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre>Hi,

I have a Lenovo IdeaPad Duet Chromebook CT-X636F, detected as Mediatek
krane sku176 board. (mt8183-kukui-krane)

The display failed to initialize on the mainline kernel (linux
6.18-rc7). Using the same config, on stable (linux 6.17.9) the display
works fine.

config: <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D220803" ta=
rget=3D"_blank">https://bugzilla.kernel.org/show_bug.cgi?id=3D220803</a>

With the system on mainline kernel, I was able to check the serial
console, the error on dmesg looks like this:

[    6.513400] mediatek-drm mediatek-drm.18.auto: Building display
pipeline for MMSYS 0
[    6.514983] mediatek-drm mediatek-drm.18.auto: Display HW Pipeline
built with 9 components.
[    6.515009] mediatek-drm mediatek-drm.18.auto: Invalid display hw
pipeline. Last component: 38 (ret=3D-2)
[    6.524422] mediatek-drm mediatek-drm.18.auto: probe with driver
mediatek-drm failed with error -22

Temporarily modifying mtk_drm_drv.c by commenting calls to
mtk_drm_of_ddp_path_build_one CRTC_EXT and CRTC_THIRD allows the
display to function even on mainline. I was also able to add some
logging and determine that building the HW pipeline for CRTC_MAIN
works, but because building CRTC_EXT fails, the entire display would
not initialize.

</pre>
          </blockquote>
        </blockquote>
        <pre>I think this is the issue:
<a href=3D"https://lkml.org/lkml/2025/9/12/1242" target=3D"_blank">https://=
lkml.org/lkml/2025/9/12/1242</a>

On Wed, Nov 26, 2025 at 2:06=E2=80=AFPM Evans Jahja <a href=3D"mailto:evans=
jahja13@gmail.com" target=3D"_blank">&lt;evansjahja13@gmail.com&gt;</a> wro=
te:
</pre>
        <blockquote type=3D"cite">
          <pre>Hi Angelo, I was able to isolate the problem further to the =
dts. After
bisecting the arch/arm64/boot/dts/mediatek/ and building the dts, it
seems like this is the first commit that introduced the issue on my
device.

commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
Author: AngeloGioacchino Del Regno <a href=3D"mailto:angelogioacchino.delre=
gno@collabora.com" target=3D"_blank">&lt;angelogioacchino.delregno@collabor=
a.com&gt;</a>
Date:   Thu Jul 24 10:39:08 2025 +0200

    arm64: dts: mediatek: mt8183: Migrate to display controller OF graph

I am linking my full bisect log here:

<a href=3D"https://bugzilla.kernel.org/attachment.cgi?id=3D308962&amp;actio=
n=3Dedit" target=3D"_blank">https://bugzilla.kernel.org/attachment.cgi?id=
=3D308962&amp;action=3Dedit</a>
</pre>
        </blockquote>
        <pre>where we&#39;re unconditionally adding mmsys_ep_ext.

The issue seems to be caused by the recent addition of CRTC_EXT on the
base mt8183

Please kindly take a look. Apologies for any mistake, this is my first issu=
e.

Evans Jahja


</pre>
      </blockquote>
      <pre></pre>
    </blockquote>
  </div>

</div>

--00000000000076e465064a2614db--
--00000000000076e466064a2614dd
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgMFADCABgkqhkiG9w0BBwEAAKCCEacw
ggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYTAkRFMSsw
KQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYDVQQLDBZULVN5
c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFsUm9vdCBDbGFzcyAy
MB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNVBAYTAkRFMUUwQwYDVQQK
EzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMg
ZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERGTi1WZXJlaW4gQ2VydGlmaWNhdGlv
biBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMtg1/9moUHN0vqH
l4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZsFVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8F
XRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0peQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+Ba
L2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qL
NupOkSk9s1FcragMvp0049ENF4N1xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz
9AkH4wKGMUZrAcUQDBHHWekCAwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQU
k+PYMiba1fFKpZFK4OpL4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYD
VR0TAQH/BAgwBgEB/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGC
LB4wCAYGZ4EMAQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUv
cmwvVGVsZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYB
BQUHMAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5jZXIw
DQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4eTizDnS6
dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/MOaZ/SLick0+
hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3SPXez7vTXTf/D6OWS
T1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc22CzeIs2LgtjZeOJVEqM7
h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bPZYoaorVyGTkwggWsMIIElKAD
AgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYDVQQGEwJERTFFMEMGA1UEChM8VmVy
ZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYu
MRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRERk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0
aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcNMzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUx
RTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5n
c25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9i
YWwgSXNzdWluZyBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp
1xCeOdfZojDbchwFfylfS2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6W
LkDh0YNMZj0cZGnlm6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mI
TQ5HjUhfZZkQ0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUk
P7agCwf9TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22M
ZD08WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAdBgNV
HQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK4OpL4qIM
z+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwtcm9v
dC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYBBQUHAQEEgdAwgc0wMwYI
KwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1TZXJ2ZXIvT0NTUDBKBggrBgEF
BQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY2FjZXJ0
L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJv
b3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/
DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCN
T1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7Ln8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+
lgQCXISoKTlslPwQkgZ7nu7YRrQbtQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v
9NsH1VuEGMGpuEvObJAaguS5Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7
EUkp2KgtdRXYShjqFu9VNCIaE40GMIIG3TCCBcWgAwIBAgIMKQ1UjkVvPdYb/gWXMA0GCSqGSIb3
DQEBCwUAMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVp
bmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUw
IwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTIzMDgyOTExMzExMVoXDTI2
MDgyODExMzExMVowdDELMAkGA1UEBhMCREUxHTAbBgNVBAoMFFVuaXZlcnNpdGFldCBMZWlwemln
MQwwCgYDVQQLDANJVFAxEDAOBgNVBAQMB0dlc3NlcnQxDjAMBgNVBCoMBURlbmlzMRYwFAYDVQQD
DA1EZW5pcyBHZXNzZXJ0MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA180a37O7LBXI
UsPA08PLHhzl8Ab4FrNkYA8/X9GTB37Ch9yv+PoshSo26ScbeF2fjSg392uxz2u9dIduNPKYdWEu
bv9QeHSsofEAJHof0E9BjSIj+U7Vrc/hIUO2Qos6qpWIgj68wiRLk/J2fLY/c/NjTDfAGK8SE4YV
063tKmveh/6i/50Qpis/D4frQ4x6FAhk+djAiCRweB6gPivqbfk4hAztwnjWJG9h3aznD/Lnv1Tj
sgWx1X6mkrobtVvx/XrTa7GBHcWkA9CwJ7gNfUNA4lYI1KVyxIuWUJNbQozBnuFFt2k09NXaUM/V
x6YhjTCF8f3QntBSBOaVTfHhVGVVfficc26bjyUuCUd8+6kFrIwg1GGg/ai1hzTCWD1oBjGh0QBj
riFzoKcIXcoR8degAelalyiLSizNQKOKqS2wW8XYGcqvh7aUjQ+R5X1T/yztq38X8DGbgRsL9yAg
39mupqxU0Aq8XgOua6X/1LS2ty51ZMG0X6ZaNaaZPPInOpkW/KUg/DbdqP3BoJugs1FPsP/Cm4/p
S8I0i1NWFBsYOFHYXddvEAP31PWPSO5jSZRXuC0tqgKuNuBHdkQHUuOroZ/eWia5JdADIiSjJ7x7
LeBuWu5MTxnWWl5B/PxGs8DFUViRI/EDlmy4z7HUvCN7OUnLw2da17cE0WhKQpkCAwEAAaOCAlMw
ggJPMD4GA1UdIAQ3MDUwDwYNKwYBBAGBrSGCLAEBBDAQBg4rBgEEAYGtIYIsAQEECzAQBg4rBgEE
AYGtIYIsAgEECzAJBgNVHRMEAjAAMA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcD
AgYIKwYBBQUHAwQwHQYDVR0OBBYEFFFBhnnkvXs8pO2Z47Nk8Y/ApvzZMB8GA1UdIwQYMBaAFGs6
mIv58lOJ2uCtsjIeCR/oqjt0MCUGA1UdEQQeMByBGmdlc3NlcnRAaXRwLnVuaS1sZWlwemlnLmRl
MIGNBgNVHR8EgYUwgYIwP6A9oDuGOWh0dHA6Ly9jZHAxLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2Jh
bC1nMi9wdWIvY3JsL2NhY3JsLmNybDA/oD2gO4Y5aHR0cDovL2NkcDIucGNhLmRmbi5kZS9kZm4t
Y2EtZ2xvYmFsLWcyL3B1Yi9jcmwvY2FjcmwuY3JsMIHbBggrBgEFBQcBAQSBzjCByzAzBggrBgEF
BQcwAYYnaHR0cDovL29jc3AucGNhLmRmbi5kZS9PQ1NQLVNlcnZlci9PQ1NQMEkGCCsGAQUFBzAC
hj1odHRwOi8vY2RwMS5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NhY2VydC9jYWNl
cnQuY3J0MEkGCCsGAQUFBzAChj1odHRwOi8vY2RwMi5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwt
ZzIvcHViL2NhY2VydC9jYWNlcnQuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQCByEEfIzbvKPXWQWn+
MUfVEoO3zSadyQw6nITFmaDZfSDpuFyDKm/tX64/0SVgk8BrsZ0MI6RiFLMchOX/FbsFiERpa8+w
b5r/8SFoImw76nK05E4JJBLLLF3Uk5djHZWhIT2NpGxnmqRVbCC8nzHTiXAx2J1c3Anuzpgpj5dF
DFYkLC53Wmpk/FbUTDiP5rZZ8Ur9OvCMb/dRVhu783NTp3Ik1Loy5AV6gW16dBowZ+guQObQvPNr
XYAbj6ag7bqUtZD29CwyEuSakc2QrKbuzZu4AhUq/IUFlYbougHMVzeSJmn3ilN3nMwhr9eJOJ9p
0oLXIXhoNNm2CjelnjjEMYIGGDCCBhQCAQEwgZ4wgY0xCzAJBgNVBAYTAkRFMUUwQwYDVQQKDDxW
ZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMgZS4g
Vi4xEDAOBgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4gR2xvYmFsIElzc3Vpbmcg
Q0ECDCkNVI5Fbz3WG/4FlzANBglghkgBZQMEAgMFAKCCA0owGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYwMjA2MTEyMTMwWjBPBgkqhkiG9w0BCQQxQgRAOieAaQTU
c7EdOxCokDkRrudpdrpDgb7xiyqCVLMCN5Jhf6fJjgGzWgUPQQQAFL5Dd/MVQ6CZZlXKUZCs6BYf
GDCBrwYJKwYBBAGCNxAEMYGhMIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1
ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYD
VQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBAgwpDVSO
RW891hv+BZcwgbEGCyqGSIb3DQEJEAILMYGhoIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8
VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUu
IFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5n
IENBAgwpDVSORW891hv+BZcwggFXBgkqhkiG9w0BCQ8xggFIMIIBRDALBglghkgBZQMEASowCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCCqGSIb3DQMCAgEFMA0GCCqGSIb3DQMCAgEFMAcGBSsO
AwIHMA0GCCqGSIb3DQMCAgEFMAcGBSsOAwIaMAsGCWCGSAFlAwQCATALBglghkgBZQMEAgIwCwYJ
YIZIAWUDBAIDMAsGCWCGSAFlAwQCBDALBglghkgBZQMEAgcwCwYJYIZIAWUDBAIIMAsGCWCGSAFl
AwQCCTALBglghkgBZQMEAgowCwYJKoZIhvcNAQEBMAsGCSuBBRCGSD8AAjAIBgYrgQQBCwAwCAYG
K4EEAQsBMAgGBiuBBAELAjAIBgYrgQQBCwMwCwYJK4EFEIZIPwADMAgGBiuBBAEOADAIBgYrgQQB
DgEwCAYGK4EEAQ4CMAgGBiuBBAEOAzANBgkqhkiG9w0BAQEFAASCAgBlCmVxp8G0ml7EySdtAuvn
M8eAEHG41Oa/N6+Zm5rmTBhsEKXXkrqVf0OVl9UhiIk5Rr9IumaTD4WMT61zi8Ji8bPNSHUybbqi
jKSeLIkKV7vmbQDOaW4ZYr+ufHAEZIDnss2BCZ+2M6DeYQio/fJ2OXriLD33aIm1PYMaJzGowyTJ
bvRBcb/cbgBjGCZwhT+i4NFVAeLNYiYR4JcJCskgW2Ypc01ABQKClXABM0V8Qmgt2nIrp37+5jmM
BHQMCMBa5cXAmUybLBXMbSk+c3b7opgZKZukdqn0isucMNeYBHnv7IY4pJDxvgU8f5c/NGEL08OQ
MWdACsyukoYhatQd0EhWcmcyFpNxpOcj/o6k0C0SHt/KfzkVam3ixYu1G/TMhASAfOprM+DZ+mGN
HHv7CcZv55IZJ/NL1DyMGvuKO3Hjgey5FVbWIxJGYaVdt1UrGh2YXHY+ow4/cdtdyDcnj8g9Exo7
pDkfxeG3ZwRn9HRVQBBwQhinFN2Za83FlR5hWKKDf2Iq4r7/0JT9jSdHrRd825taLEMaOo9+wn4c
TTmdvcfdv08L6xjPm+OFNLZ4Kfnb1Roethcwwien3ylLnkg7qKSqDdnG6sPr+7q630A6LtJ23Grj
LMYwHI4t3xYjKygwlpPrT9nX6beP1B3JYysMgpd4Demi8nGp9+3rHQAAAAAAAA==
--00000000000076e466064a2614dd--
