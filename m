Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F058F63CF
	for <regressions@lists.linux.dev>; Fri,  3 May 2024 19:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714764144; cv=none; b=Ydp04fR1C/7eNmfSen1zfe9Vij1fKORXuX7F1KEnEk4My7P1hNoGbyZfGRLaWd5ddw0aiyDrRHFjKhuxFAp3/eQUGTOVaBIOAxMhZHzH9NnCAAjCeanGB+EH43NyeVYZOGbtUKnKbRzs5EckdZcesq+V3Qmq7e07f2amn6j6gmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714764144; c=relaxed/simple;
	bh=1RqUL/IAtVDsbNvDGXYbqVXX9t1cfymUmQpyF2IDRBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPvvbKKki2MFZY7hF92T/DH+cWN+KusDpds3j/qzkcbpcKXoW/NsseLQP44k87+VXCpRQ/4yCkuWp1MBOo5CxV3758NxgmRwZhb1jjut7KqGu4ag/A33BUERZbSzti6Pb9AceMqXgkQFvGuPxqStfxuv4xiC9vMJETMP7KPNsEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDWTv6ei; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDWTv6ei"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e20f2db068so271461fa.2
        for <regressions@lists.linux.dev>; Fri, 03 May 2024 12:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714764139; x=1715368939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGx2n5yoiLSRIt71Nt2FP9+93qkzoiQNbPT3yt8Y8TQ=;
        b=hDWTv6eiDD9dGzp5XG0foBoz3cQYp9ov4NhMYuxQb3nZSwJf4F26KZ+x1Q+OWGOs7S
         arVg7WlXBpLc2tArOjF/gBg4wcdpLXXskvBxuMZd9Rl/5dJdlaTCfGMQjDzYhn9FtrNo
         6Sib2Ph8eG0AakN4nsvgixH3eRXp6HpZ4ZGLt0ww2PYlS7gEl8YjaNzBVBC5yAxTDG1B
         2N3A26qGV5cy9QFBc6lE+oaq6JVilwnky2zOeSf9BJIUqJ8kGE24nmnTccNY+KHqI4hz
         GjIlwC5IGl4ElyaVnDjxZSLd/28QKTd5kIjeIeNekDjqeFqPnrGUnOs4BEpx5hlQwB+H
         +/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714764139; x=1715368939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGx2n5yoiLSRIt71Nt2FP9+93qkzoiQNbPT3yt8Y8TQ=;
        b=TZ1oi39AQRadzSUJZZqjSXIC+gLhEV4v2oakvltvucXGeQLvYiwagNhhcGG9/yIBeB
         s91joQhxrGRFH8rATX6jdxe+xAlNuX0ReA+rTolNQ2TPpEtNmJRIgCtsy1kpEVG5+nek
         Zcai6mzkQLzap1GeypSin01+ZpMKAnagmVW0+iTP9Mj+ix5AGELnEr3ikiom7mbRfCVP
         /q5e/o8WwfBJIiCj6SoswhN3pui6TNqKvlXO+6A4NH7o3aj/bTUNCuhcRppXKvKOIxlY
         7CKMBTpo4Djh6b01IM1xWm+QzlVAJR6JaTtn3jD13Fxw+k/ZiIsdrRz1M6R0eMPocvTl
         J2yg==
X-Forwarded-Encrypted: i=1; AJvYcCXKG9UCr2XXq68mHwdrY+PoZi7N47Y3uqfPAAQOO4F7IjIYxvpqedlc7rONwDz/DURQRNj3NmZ9TjlN/z+xU7/4aUyTLXcUpNXavEY=
X-Gm-Message-State: AOJu0YzA8kqFlIr9wGb+wC0uccxhkoUg8SFnsP9FWmcoM7KyfP9sPII8
	5bUe+p5x1DziGDHJI+sWKRaQ1bNm7EZarwGNaTc8s47xN5yPYpkbBKp5YLmoBgs7eGiNnz7aAEP
	YNovGa1r9FTmNsfrBKv8GAkuLzts=
X-Google-Smtp-Source: AGHT+IG0mJicwsO+tXDvlFh1LOx/Y/2dM/UTZxiEc7Av7UUdup4AyeP7l92N/Fp1tkLm1CwXmjSoYjx0j3kkaZZgV/o=
X-Received: by 2002:a2e:a406:0:b0:2df:eee9:c71f with SMTP id
 p6-20020a2ea406000000b002dfeee9c71fmr2451126ljn.7.1714764138823; Fri, 03 May
 2024 12:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1714658761-15326-1-git-send-email-quic_zijuhu@quicinc.com>
In-Reply-To: <1714658761-15326-1-git-send-email-quic_zijuhu@quicinc.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 3 May 2024 15:22:06 -0400
Message-ID: <CABBYNZJc=Pzt02f0L3KOSLqkJ+2SwO=OZibA=0S0T3vKPDwPyw@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: qca: Fix BT enable failure again for
 QCA6390 after warm reboot
To: Zijun Hu <quic_zijuhu@quicinc.com>
Cc: luiz.von.dentz@intel.com, marcel@holtmann.org, 
	linux-bluetooth@vger.kernel.org, wt@penguintechs.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zijun,

On Thu, May 2, 2024 at 10:06=E2=80=AFAM Zijun Hu <quic_zijuhu@quicinc.com> =
wrote:
>
> Commit 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on closed
> serdev") will cause below regression issue:
>
> BT can't be enabled after below steps:
> cold boot -> enable BT -> disable BT -> warm reboot -> BT enable failure
> if property enable-gpios is not configured within DT|ACPI for QCA6390.
>
> The commit is to fix a use-after-free issue within qca_serdev_shutdown()
> during reboot, but also introduces this regression issue regarding above
> steps since the VSC is not sent to reset controller during warm reboot.
>
> Fixed by sending the VSC to reset controller within qca_serdev_shutdown()
> once BT was ever enabled, and the use-after-free issue is also be fixed
> by this change since serdev is still opened when send to serdev.
>
> Fixes: 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on closed s=
erdev")
> Cc: stable@vger.kernel.org
> Reported-by: Wren Turkal <wt@penguintechs.org>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218726
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> Tested-by: Wren Turkal <wt@penguintechs.org>
> ---
>  drivers/bluetooth/hci_qca.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 0c9c9ee56592..8e35c9091486 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2450,13 +2450,12 @@ static void qca_serdev_shutdown(struct device *de=
v)
>         struct qca_serdev *qcadev =3D serdev_device_get_drvdata(serdev);
>         struct hci_uart *hu =3D &qcadev->serdev_hu;
>         struct hci_dev *hdev =3D hu->hdev;
> -       struct qca_data *qca =3D hu->priv;
>         const u8 ibs_wake_cmd[] =3D { 0xFD };
>         const u8 edl_reset_soc_cmd[] =3D { 0x01, 0x00, 0xFC, 0x01, 0x05 }=
;
>
>         if (qcadev->btsoc_type =3D=3D QCA_QCA6390) {
> -               if (test_bit(QCA_BT_OFF, &qca->flags) ||
> -                   !test_bit(HCI_RUNNING, &hdev->flags))

This probably deserves a comment on why you end up with
HCI_QUIRK_NON_PERSISTENT_SETUP and HCI_SETUP flags here, also why you
are removing the flags above since that was introduce to prevent
use-after-free this sort of revert it so I do wonder how serdev can
still be open if you haven't tested for QCA_BT_OFF for example?

> +               if (test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirk=
s) ||
> +                   hci_dev_test_flag(hdev, HCI_SETUP))
>                         return;
>
>                 serdev_device_write_flush(serdev);
> --
> 2.7.4
>


--=20
Luiz Augusto von Dentz
