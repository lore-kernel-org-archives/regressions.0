Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F3514D431
	for <regressions@lists.linux.dev>; Thu, 16 May 2024 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715874958; cv=none; b=ggs6RGK79a7ZPHTZy9+tsIqVe8tTUvy8/idU8Nb01xyXg7FIBMPwj8KLDBkVnwkYv6f1umL0D5HSnB8HO+q+FVva90yxCqX+3o9tf6upV+a/wM4fa6109QAPW83O0AtVpBt2ha8lZPksYR3BXHRsY03DN9rhdRTLifpaxETLhUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715874958; c=relaxed/simple;
	bh=GotmUVvg3yCA1K/0AUhNy3lVYojERI0YjVqh8CZv7+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9VqC2sUTegxi3EWTRPPKkYhB+QziU5b8UEsFdH7Dvd3VqsJixoTfyhPFYQWBGXoiN1lt5UgjPud47O2g+melUaYAvzrAL3sCtSolOsBHuVxYT9Udg7J8meOnzXC8m9g3qatCMZ/gjxDvzZywKegsihkZH/+ui7LpISq7AKnGGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoVHfB9/; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoVHfB9/"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e538a264e0so12590171fa.1
        for <regressions@lists.linux.dev>; Thu, 16 May 2024 08:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715874955; x=1716479755; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X51fSppkpogm5g68VevzSjdTrmvDiJaepwBpjEkIupc=;
        b=RoVHfB9/57SSSB/snr/PJx4uGBwtNkS4VDLaDU7oXSMwp4Fj+P6mAFAkx2uCqWc5lz
         VBvPbo60df1kr1jQOAK88vv0PXZ8xMLPeVL8DOzQxpYhvuZtSlTnltL0aIHkcAHu4Mfe
         04hU1meFp/Hs5Z66xFzn4mdCmCwbt9ztiIKlpFeKNtnqSgsaKhxMrxgcDbpbIjg0hnjm
         s6dBYGfOXYsKsVELtylgeQRdToTG9/Ft4Wz7nXvc3YaHDByF0JfFVjYvo1EJ8ShgXBIw
         VgTIKDyDwtzt3ygQ3IzWrjBB9+E7vygdNakbgscGnK7xJ/O8uQBcenLDmgOSoNkY0yh8
         bC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715874955; x=1716479755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X51fSppkpogm5g68VevzSjdTrmvDiJaepwBpjEkIupc=;
        b=JNDiq2R+QEtwyT7otgFprqeoFck/3zxkeHDZsQhW73D0ELYTRH8pTBISJQ62mkG2o3
         GUqjhfItCJBtHWa8Eoj+nIzoq1Zl/fCgcay/ZHTv+jCBxnbmxE+OTFiAvQhiwWbBXDW1
         X6BL/C+qyYQunP1MqE5VfyhZ5Z6+0svfXGYJnRvUKqmemOwR1PzARoeROvhvpn7yKMKj
         OxlQMFAmITH8+TaqXHtWYzXdMt56kDFcOXu0GkHJsgZx+3iUkjiEt+42WJUOBCcNV4Qg
         B6DxBH09N5YQ/5MFWDCSUOPjsXfvIm3P9niOH7ec1gzAaaRsevKnuIiB0oOUUOgDlQVs
         gAjg==
X-Forwarded-Encrypted: i=1; AJvYcCWzte2CGQF8vs4ski5vaowPSUPEbhUxuoo+0jhnw2oTAIufSr1Eph9hfQzUlzI9tfIgqvKGUSKT0ev253H+CTKNbGQ9Hat2dNol3T8=
X-Gm-Message-State: AOJu0YxSRG2wBg/XJhk6l+XZ69D0MiRFcQ58uHkAnGFmB2nnhW66SyO5
	UDvMtz186qSVzIA618p58cN4bEFk4m3SZbUatowqSad6/csd5Kyrio370VWiQ+3NxrFoNvm7cFa
	3alSDfdrd7kS2Iog0YcRgU/V9GP0=
X-Google-Smtp-Source: AGHT+IEFeaCtLRNo5VoiulyvOQ9u5fQIcZftbw9jZKZ2+uGwIk1yQQuY5A0kQEIrPVM/0MW0dIOTQUmRUckvz++9TIM=
X-Received: by 2002:a2e:9657:0:b0:2e6:f57a:9854 with SMTP id
 38308e7fff4ca-2e6f57aa0afmr56199111fa.38.1715874954817; Thu, 16 May 2024
 08:55:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1715866294-1549-1-git-send-email-quic_zijuhu@quicinc.com> <f343ecae-efee-4bdc-ac38-89b614e081b5@163.com>
In-Reply-To: <f343ecae-efee-4bdc-ac38-89b614e081b5@163.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 16 May 2024 11:55:42 -0400
Message-ID: <CABBYNZ+nLgozYxL=znsXrg0qoz-ENgSBwcPzY-KrBnVJJut8Kw@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: qca: Fix BT enable failure again for
 QCA6390 after warm reboot
To: Lk Sii <lk_sii@163.com>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>, luiz.von.dentz@intel.com, marcel@holtmann.org, 
	linux-bluetooth@vger.kernel.org, wt@penguintechs.org, 
	regressions@lists.linux.dev, pmenzel@molgen.mpg.de, 
	krzysztof.kozlowski@linaro.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 16, 2024 at 10:57=E2=80=AFAM Lk Sii <lk_sii@163.com> wrote:
>
>
>
> On 2024/5/16 21:31, Zijun Hu wrote:
> > Commit 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on closed
> > serdev") will cause below regression issue:
> >
> > BT can't be enabled after below steps:
> > cold boot -> enable BT -> disable BT -> warm reboot -> BT enable failur=
e
> > if property enable-gpios is not configured within DT|ACPI for QCA6390.
> >
> > The commit is to fix a use-after-free issue within qca_serdev_shutdown(=
)
> > by adding condition to avoid the serdev is flushed or wrote after close=
d
> > but also introduces this regression issue regarding above steps since t=
he
> > VSC is not sent to reset controller during warm reboot.
> >
> > Fixed by sending the VSC to reset controller within qca_serdev_shutdown=
()
> > once BT was ever enabled, and the use-after-free issue is also fixed by
> > this change since the serdev is still opened before it is flushed or wr=
ote.
> >
> > Verified by the reported machine Dell XPS 13 9310 laptop over below two
> > kernel commits:
> > commit e00fc2700a3f ("Bluetooth: btusb: Fix triggering coredump
> > implementation for QCA") of bluetooth-next tree.
> > commit b23d98d46d28 ("Bluetooth: btusb: Fix triggering coredump
> > implementation for QCA") of linus mainline tree.
> >
> > Fixes: 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on closed=
 serdev")
> > Cc: stable@vger.kernel.org
> > Reported-by: Wren Turkal <wt@penguintechs.org>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218726
> > Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> > Tested-by: Wren Turkal <wt@penguintechs.org>
> > ---
> > V1 -> V2: Add comments and more commit messages
> >
> > V1 discussion link:
> > https://lore.kernel.org/linux-bluetooth/d553edef-c1a4-4d52-a892-715549d=
31ebe@163.com/T/#t
> >
> >  drivers/bluetooth/hci_qca.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index 0c9c9ee56592..9a0bc86f9aac 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -2450,15 +2450,27 @@ static void qca_serdev_shutdown(struct device *=
dev)
> >       struct qca_serdev *qcadev =3D serdev_device_get_drvdata(serdev);
> >       struct hci_uart *hu =3D &qcadev->serdev_hu;
> >       struct hci_dev *hdev =3D hu->hdev;
> > -     struct qca_data *qca =3D hu->priv;
> >       const u8 ibs_wake_cmd[] =3D { 0xFD };
> >       const u8 edl_reset_soc_cmd[] =3D { 0x01, 0x00, 0xFC, 0x01, 0x05 }=
;
> >
> >       if (qcadev->btsoc_type =3D=3D QCA_QCA6390) {
> > -             if (test_bit(QCA_BT_OFF, &qca->flags) ||
> > -                 !test_bit(HCI_RUNNING, &hdev->flags))
> > +             /* The purpose of sending the VSC is to reset SOC into a =
initial
> > +              * state and the state will ensure next hdev->setup() suc=
cess.
> > +              * if HCI_QUIRK_NON_PERSISTENT_SETUP is set, it means tha=
t
> > +              * hdev->setup() can do its job regardless of SoC state, =
so
> > +              * don't need to send the VSC.
> > +              * if HCI_SETUP is set, it means that hdev->setup() was n=
ever
> > +              * invoked and the SOC is already in the initial state, s=
o
> > +              * don't also need to send the VSC.
> > +              */
> > +             if (test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirk=
s) ||
> > +                 hci_dev_test_flag(hdev, HCI_SETUP))
> >                       return;
> >
> > +             /* The serdev must be in open state when conrol logic arr=
ives
> > +              * here, so also fix the use-after-free issue caused by t=
hat
> > +              * the serdev is flushed or wrote after it is closed.
> > +              */
> >               serdev_device_write_flush(serdev);
> >               ret =3D serdev_device_write_buf(serdev, ibs_wake_cmd,
> >                                             sizeof(ibs_wake_cmd));
> i believe Zijun's change is able to fix both below issues and don't
> introduce new issue.
>
> regression issue A:  BT enable failure after warm reboot.
> issue B:  use-after-free issue, namely, kernel crash.
>
>
> For issue B, i have more findings related to below commits ordered by tim=
e.
>
> Commit A: 7e7bbddd029b ("Bluetooth: hci_qca: Fix qca6390 enable failure
> after warm reboot")
>
> Commit B: de8892df72be ("Bluetooth: hci_serdev: Close UART port if
> NON_PERSISTENT_SETUP is set")
> this commit introduces issue B, it is also not suitable to associate
> protocol state with state of lower level transport type such as serdev
> or uart, in my opinion, protocol state should be independent with
> transport type state, flag HCI_UART_PROTO_READY is for protocol state,
> it means if protocol hu->proto is initialized and if we can invoke its
> interfaces.it is common for various kinds of transport types. perhaps,
> this is the reason why Zijun's change doesn't use flag HCI_UART_PROTO_REA=
DY.

Don't really follow you here, if HCI_UART_PROTO_READY indicates the
protocol state they is even _more_ important to use before invoking
serdev APIs, so checking for the quirk sound like a problem because:

[1] hci_uart_close
     /* When QUIRK HCI_QUIRK_NON_PERSISTENT_SETUP is set by driver,
     * BT SOC is completely powered OFF during BT OFF, holding port
     * open may drain the battery.
     */
    if (test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
        clear_bit(HCI_UART_PROTO_READY, &hu->flags);
        serdev_device_close(hu->serdev);
    }

[2] hci_uart_unregister_device
    if (test_bit(HCI_UART_PROTO_READY, &hu->flags)) {
        clear_bit(HCI_UART_PROTO_READY, &hu->flags);
        serdev_device_close(hu->serdev);
    }

So only in case 1 checking the quirk is equivalent to
HCI_UART_PROTO_READY on case 2 it does actually check the quirk and
will proceed to call serdev_device_close, now perhaps the code is
assuming that shutdown won't be called after that, but it looks it
does since:

static void serdev_drv_remove(struct device *dev)
{
    const struct serdev_device_driver *sdrv =3D
to_serdev_device_driver(dev->driver);
    if (sdrv->remove)
        sdrv->remove(to_serdev_device(dev));

    dev_pm_domain_detach(dev, true);
}

dev_pm_domain_detach says it will power off so I assume that means
that shutdown will be called _after_ remove, so not I'm not really
convinced that we can avoid using HCI_UART_PROTO_READY, in fact the
following sequence might always be triggering:

serdev_drv_remove -> qca_serdev_remove -> hci_uart_unregister_device
-> serdev_device_close -> qca_close -> kfree(qca)
dev_pm_domain_detach -> ??? -> qca_serdev_shutdown

If this sequence is correct then qca_serdev_shutdown accessing
qca_data will always result in a UAF problem.

> Commit C: 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on
> closed serdev")
> this commit is to fix issue B which is actually caused by Commit B, but
> it has Fixes tag for Commit A. and it also introduces the regression
> issue A.
>


--=20
Luiz Augusto von Dentz
