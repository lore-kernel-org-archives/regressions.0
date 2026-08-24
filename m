Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B9E415F22
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582151; cv=pass; b=lRi4zXWVSWjcp/f9aw0oaVKZjadJNBLwDHDkAomUP51rPPvJJitByapp6jjKRbpNFUVv8Y8EX1rspwFlTAAPXZDEbKn9oEcpotAlhmV5vs+s5A9vSt3dFJOCymM0K3OSgApPpIFGg+ET+8dldohB7WoD9Ez5vAm6rxXkNz4ZzAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582151; c=relaxed/simple;
	bh=Y6V0kZp4BD8ZRN/0Gddqg9ImoedWspC2zyyA+T9P50E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TB9B+7x8kCr0cyNeNtKp9yO3CJoaDQqRpOIUSHrV9QsQ5XNQGSVYbyeph6vHV6hwJs/R84C9bQnWVCISdI6W41eATx4gpyAQce0yB1Yyvbv9iq4Ejrqd0yQ/QTBCyG+ssEUgXsIE8bk1e/iZUzgwCSwUyUBnG6/lBb1AurDt8EI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkCKtKPE; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkCKtKPE"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66c83e34212so4341969d50.0
        for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 07:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787582148; cv=none;
        d=google.com; s=arc-20260327;
        b=fJb8ITUQNlGkHqL+A0QHxptJGFjPymcilsJvhposm84b3FaQ+Ku9J/HUlaqc95QQZQ
         XH6J/VCJ17teujcUJt4Gog1or4cQSLZAK0lQCm23INEzlyP5xAv44fVsF/79mcT7iRSC
         Na+hoTawroxxcNzqFIxb6vIBexoCENb8u/o8aDPmsXtMlthPxvpwuwEs7+i6CDPIcjfx
         bzWXMicdBodhhPy1IK0wm15lI5IfY29N1/HDIxV6DdmfOJVZLNnp0OI7KoS7u4tt34oe
         ovJjv5+eRNE4ukbeOM39x8gyffauOdniYxNe4ZgEZ9/Cug3lOFOiYY9m/13rAD9f3hmu
         nUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DlEAhHb6rraj0pL5d9U0h/2riTkYg1T2t1YsFrpCceo=;
        fh=DXeFu5gHi8B0QoA70Wu9q1EVGIFbzBcHLpuv0roDS5g=;
        b=Alm3gVMDOVWPrI6SER7zh9DvX56w1VbBSMiihuW7V536gPv1TOunnEEfWaFTiBO8X7
         nqqeplgDqzbk2DLLoRVZJHsHNhrqXNLnokiYRDpPwqzz6o8Mj5WXlajSi+ztOGpvf4se
         QFRvMpR3Zn8E4dnJUNhcpwbBZtkBFc+cT+ubalOEtpOJx5T4/0sOUDZe9SNladrIFixb
         EpogfyT90z52YhZWJpxTlJDrxBJ0oNrHyczjefZRdLL+P/del7QPWjbTUfNNNPOz0TEt
         ZOODzGWLg+zV+d5oev85KJwjVKu07Cyas/4/Auc4cmXsWKAKtjuSaIGH/facW71J4yfO
         J4HA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787582148; x=1788186948; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DlEAhHb6rraj0pL5d9U0h/2riTkYg1T2t1YsFrpCceo=;
        b=JkCKtKPEZ3cr+4XOO7NcSlJlj9FnGo11BbvNHzYkHyimv33BiyvanPIlPbU1mdJV0p
         zBB/OfDbqhgaxH6Bi6zriUdhz7nx11ftUMnjINvbQ/Y82F0LMpUoPwQHLRkHk9tlx5cr
         MnfWoZLiZcMe13LQG9yIB2G2GvMImZXTFMEWfBDPhvmn4okGh3lzp3YAj8Gpj3J+VX5o
         BWTfAirye+5WNqKDwS/8dCbNTPXPqZvwLqxpPC3kMJ8tsi32TIDexq9suKpy0huElnyH
         Trm07INcS5Cx2MCrDRo3RUp7XK0nM9vaF2zw8h8gUMNmo7/e661aD39FvvXd92T+5Kzx
         11cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582148; x=1788186948;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DlEAhHb6rraj0pL5d9U0h/2riTkYg1T2t1YsFrpCceo=;
        b=m/XGlcTSteR6hs8oUUFMacnN88Qk2Z5R4JFe6oz4STQ1jlzsl/l9Pi4oUX8BeJdsfA
         CVHtc5NNVFRW+yDUAvY6r5GjFiqgwyR/YyJlEsjJUsLcBM9TGR8R3gMp2EiE2tBS7YY9
         bIr/RsMer2K6q08kJ66mDjFk1YcR4NGXlU/3LFB/8cJnwKc6ACr3FETmX3c6/A+OI6aV
         h2ZLyE9Q4drcq4/4CktLpWb4DOOwo2CVCplPg9fHT9ooqsKYLBgWXeJaEFwve+Hr9YaQ
         OnTJ3XSmf/cEwgEySNTKx4Ke0a7RQpQgB3IPrNIq1qdRJ0VliaZ28fsusY7GHzGvDAu/
         io9A==
X-Forwarded-Encrypted: i=1; AHgh+RqJVthQte0LNqG+qiHGh4h0/NdEysZZNHYi37/1UNafh1bHUAqGl+7RLjO1msdbsG7s287teDnKcnhyUA==@lists.linux.dev
X-Gm-Message-State: AFuF++kpkHRoSzemL3/LmyL+A8vyhof8FtVhwqUEQQ+bKW/E98xXWEsL
	LfIQ1i4fzwQMKZ1toSXAbDrEYxRsk4HNt7VyANJfrzo6fffCDA9w6a96WlTwvBZGHQD6DTIB22s
	jbwMVXn+it6g6hxysTSzeFvie22oVKJM=
X-Gm-Gg: AR+sD13S01eF9xDA7JB0pEqjESKWHXRLOK/r6UDUI4LvR+j7SHTffBFKBkUBk1H2Vxa
	K7ZunyNXG2FMaKxon/7FZLLBNssCMzpgJVwNNrt2pAEpYpBck/L602x5345+GlSwkB3o9YSweae
	80mG2c9jiuyBqDyoLXXbti+UUOM8CwDyMq+OaReXnR6r12JN5caoTeFQeE+F9fVWxWkMmdUE3hW
	y58ldDNjAnKr3OOMbmMvk6prToWOsPoV9w6k+8GQuBny5x56ylEb4g1aEs0BJpITqHnLsKmsirD
	f8fno6c5dS4YAyL8aJBqad/8r0Is/1FpSTXlpHeF96pOp2/e9JHwtlB/FwFlT1BD94zJ/5FXJcT
	DbcQjV0JhBpXiEchrDrPsZPF2JyIY
X-Received: by 2002:a05:690e:25d0:b0:66c:e932:2592 with SMTP id
 956f58d0204a3-66cf21deb78mr4733001d50.38.1787582148414; Mon, 24 Aug 2026
 07:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824053227.317496-1-junjie.cao@intel.com> <77f94165-3d5f-41de-8969-c7318284fd6a@leemhuis.info>
In-Reply-To: <77f94165-3d5f-41de-8969-c7318284fd6a@leemhuis.info>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 24 Aug 2026 10:35:35 -0400
X-Gm-Features: AcwNN1WxDxyNb27MNZYYLQ2YylskKFoLPXWU8dYFUVQ7iT_pAzgxPlP6dclf31Q
Message-ID: <CABBYNZK9ax+iw7xKBtdZTSERsdhQ7t41Bg_1EnG88KOYj6kFHg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCAN quirk to 0bda:a728
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Junjie Cao <junjie.cao@intel.com>, Marcel Holtmann <marcel@holtmann.org>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexej Sidorenko <alexej@sidorenko.cz>, regressions@lists.linux.dev, 
	Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org, 
	Kamil Serwus <kserwus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

On Mon, Aug 24, 2026 at 2:03=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 8/24/26 07:32, Junjie Cao wrote:
> > Commit 5ead2063611a ("Bluetooth: btrtl: fix RTL8761B/BU broken LE
> > extended scan") set HCI_QUIRK_BROKEN_EXT_SCAN for every CHIP_ID_8761B
> > device to cure repeated 0x2042 failures on an 0bda:a728 dongle. The
> > brokenness is per-dongle, not per-chip: on a TP-Link UB500 (2357:0604,
> > RTL8761BU, fw 0xdfc6d922) extended scan works, and the legacy scan
> > path the quirk forces is what is broken -- LE Set Scan Enable (0x200c)
> > times out with -110 about 30 s after firmware load, btusb resets the
> > device, and the adapter re-enumerates in an endless loop (382 firmware
> > reloads in one boot). 7.1.8, which predates the stable backport, runs
> > clean on this unit; 7.1.9 loops.
> >
> > Move the quirk from btrtl's chip-wide switch to a btusb device-table
> > flag on the USB id the original fix was verified against. Other 8761B
> > dongles return to their earlier long-standing behaviour.
> > > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2521504
> > Fixes: 5ead2063611a ("Bluetooth: btrtl: fix RTL8761B/BU broken LE exten=
ded scan")
>
> Thx. Just to make sure everyone is aware of it: Kamil (now CCed)
> reported problems due to the commit yesterday and provided patches, too:
> https://lore.kernel.org/all/20260822141115.58815-1-kserwus@gmail.com/
>
> I suggested that a quick revert might be the best approach for now,
> which Kamil submitted:
> https://lore.kernel.org/all/20260823102959.100368-1-kserwus@gmail.com/
>
> No comment yet from the BT folks yet.
>
> Ciao, Thorsten
>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Junjie Cao <junjie.cao@intel.com>
> > ---
> > #regzbot introduced: 5ead2063611a
> > #regzbot link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2521504
> >
> >  drivers/bluetooth/btrtl.c | 13 -------------
> >  drivers/bluetooth/btusb.c |  8 ++++++++
> >  2 files changed, 8 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
> > index 7f54d2d2d13a..03fa9409e3ee 100644
> > --- a/drivers/bluetooth/btrtl.c
> > +++ b/drivers/bluetooth/btrtl.c
> > @@ -1343,19 +1343,6 @@ void btrtl_set_quirks(struct hci_dev *hdev, stru=
ct btrtl_device_info *btrtl_dev)
> >       if (!btrtl_dev->ic_info)
> >               return;
> >
> > -     switch (btrtl_dev->project_id) {
> > -     case CHIP_ID_8761B:
> > -             /* RTL8761B/BU reports HCI version 5.1 but does not suppo=
rt
> > -              * the LE Extended Scan commands (Opcode 0x2042), causing
> > -              * repeated -EBUSY failures when BlueZ attempts extended
> > -              * scanning while a connection is active.
> > -              */
> > -             hci_set_quirk(hdev, HCI_QUIRK_BROKEN_EXT_SCAN);
> > -             break;
> > -     default:
> > -             break;
> > -     }
> > -
> >       switch (btrtl_dev->ic_info->lmp_subver) {
> >       case RTL_ROM_LMP_8703B:
> >               /* 8723CS reports two pages for local ext features,
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index 2bae85b0016c..84614e60d142 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -67,6 +67,7 @@ static struct usb_driver btusb_driver;
> >  #define BTUSB_INTEL_NO_WBS_SUPPORT   BIT(26)
> >  #define BTUSB_ACTIONS_SEMI           BIT(27)
> >  #define BTUSB_BARROT                 BIT(28)
> > +#define BTUSB_BROKEN_EXT_SCAN                BIT(29)
> >
> >  static const struct usb_device_id btusb_table[] =3D {
> >       /* Generic Bluetooth USB device */
> > @@ -619,6 +620,10 @@ static const struct usb_device_id quirks_table[] =
=3D {
> >       { USB_DEVICE(0x0489, 0xe130), .driver_info =3D BTUSB_REALTEK |
> >                                                    BTUSB_WIDEBAND_SPEEC=
H },
> >
> > +     /* Realtek 8761BU Bluetooth devices */
> > +     { USB_DEVICE(0x0bda, 0xa728), .driver_info =3D BTUSB_REALTEK |
> > +                                                  BTUSB_BROKEN_EXT_SCA=
N },
> > +
> >       /* Realtek Bluetooth devices */
> >       { USB_VENDOR_AND_INTERFACE_INFO(0x0bda, 0xe0, 0x01, 0x01),
> >         .driver_info =3D BTUSB_REALTEK },
> > @@ -4403,6 +4408,9 @@ static int btusb_probe(struct usb_interface *intf=
,
> >       if (id->driver_info & BTUSB_INVALID_LE_STATES)
> >               hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LE_STATES);
> >
> > +     if (id->driver_info & BTUSB_BROKEN_EXT_SCAN)
> > +             hci_set_quirk(hdev, HCI_QUIRK_BROKEN_EXT_SCAN);
> > +
> >       if (id->driver_info & BTUSB_DIGIANSWER) {
> >               data->cmdreq_type =3D USB_TYPE_VENDOR;
> >               hci_set_quirk(hdev, HCI_QUIRK_RESET_ON_CLOSE);

Any chance to test this change? It looks better since it does remove
the original workaround for the specific USB ID while also fixing the
regression.

--=20
Luiz Augusto von Dentz
