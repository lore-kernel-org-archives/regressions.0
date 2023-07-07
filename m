Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807F8A954
	for <regressions@lists.linux.dev>; Fri,  7 Jul 2023 09:41:48 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7656652da3cso155346585a.1
        for <regressions@lists.linux.dev>; Fri, 07 Jul 2023 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688722907; x=1691314907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f1H87IT1KxERv/QSJsjsKJPplxoIARfdzpnvpKldpmI=;
        b=ThOeo9d3EvutWunUKVZdN5JmByIpYKnG9+E7k601GSh1pP4FHmnyFiI9IDq8bTOz/7
         75FvYx9PTTT08Lc+aVSE+qxE7mnO9zLUVvhlUJtPFsDu9StTH8hDEVeUu46roHNQGEkL
         mTk2324xVsfcHDfffC1Qyzc89lJpHyjxkEoXySoAD8JgigJJTNqWHWQ0QOmxMa2RpmDV
         aIYtwpEsmoxQtaQ7V5DY3E50esljCT41D2yyTqTZM+GxdV4EmT28ZSUndzOawc1Zvmud
         yMpNrjJ10OyCerhwnmZWnFQTscTEwAFIBDBObn6jMAdPm/oVyjNsn+op+kKe8ZSeZtPQ
         Je+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688722907; x=1691314907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1H87IT1KxERv/QSJsjsKJPplxoIARfdzpnvpKldpmI=;
        b=YgwO+bWgu0NPF48ZQfLh24/TybZFVleEdemQFhYV0V+NCBIa2u4oh/84k37pGTnc2q
         zzg6b7z7XWJpXW23zJ2JqpfCp8zn7cEnfYeSHe0jqPCXl+BjflwgcLdJNJ4McjeBQqaA
         6knj4N4VK0nzQf0knmhtjGruJ1aTsexHp7MQAS/HxdMpkDHVY4vu3ubtQM7SxCdgi3lu
         IjU8za3Y7PQJlQR/f5bAK32OUM+hov2e/uY1/P85ZrqBI8OXGTmbn/JInHFpSnck07Lb
         NruVV+M5azBf5vm2Ep4ZuXf0kLQlwNElBO49KPjquLH3CU8/8s6m00dwvJ1XGXU95qde
         xQGg==
X-Gm-Message-State: ABy/qLaW7WYqKhmpT1n79daSN5XNZt26IB7LaNO7WNMCl9aUGdIHtPD+
	LmrDxyGcyb7QXedOpAAHRJwD+4jIFook48Lek2Gocw==
X-Google-Smtp-Source: APBJJlFZlS5WMjckDXcsFWaLy4EQyAspqR3fiYE2RhQxmaQKAbUHr4udmeBY7ue3I2MxpwoLd8R/dD4kntChkCj2HF4=
X-Received: by 2002:ac8:5aca:0:b0:403:9ef2:fec8 with SMTP id
 d10-20020ac85aca000000b004039ef2fec8mr193297qtd.12.1688722907182; Fri, 07 Jul
 2023 02:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230531090424.3187-1-johan+linaro@kernel.org> <20230531090424.3187-3-johan+linaro@kernel.org>
In-Reply-To: <20230531090424.3187-3-johan+linaro@kernel.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Fri, 7 Jul 2023 15:11:11 +0530
Message-ID: <CAMi1Hd3fe=wk02WG8J7K5Ud1GcWkuKKKrxFjkNguxDkzNz2WVQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] Bluetooth: fix use-bdaddr-property quirk
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Wed, 31 May 2023 at 14:35, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Devices that lack persistent storage for the device address can indicate
> this by setting the HCI_QUIRK_INVALID_BDADDR which causes the controller
> to be marked as unconfigured until user space has set a valid address.
>
> The related HCI_QUIRK_USE_BDADDR_PROPERTY was later added to similarly
> indicate that the device lacks a valid address but that one may be
> specified in the devicetree.
>
> As is clear from commit 7a0e5b15ca45 ("Bluetooth: Add quirk for reading
> BD_ADDR from fwnode property") that added and documented this quirk and
> commits like de79a9df1692 ("Bluetooth: btqcomsmd: use
> HCI_QUIRK_USE_BDADDR_PROPERTY"), the device address of controllers with
> this flag should be treated as invalid until user space has had a chance
> to configure the controller in case the devicetree property is missing.
>
> As it does not make sense to allow controllers with invalid addresses,
> restore the original semantics, which also makes sure that the
> implementation is consistent (e.g. get_missing_options() indicates that
> the address must be set) and matches the documentation (including
> comments in the code, such as, "In case any of them is set, the
> controller has to start up as unconfigured.").
>

This patch broke Bluetooth on Dragonboard 845c (SDM845) devboard.
Reverting this patch fixes the BT breakage and I see the following
messages in dmesg:

Bluetooth: hci0: setting up wcn399x
Bluetooth: hci0: QCA Product ID   :0x0000000a
Bluetooth: hci0: QCA SOC Version  :0x40010214
Bluetooth: hci0: QCA ROM Version  :0x00000201
Bluetooth: hci0: QCA Patch Version:0x00000001
Bluetooth: hci0: QCA controller version 0x02140201
Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
Bluetooth: hci0: QCA Downloading qca/crnv21.bin
Bluetooth: hci0: QCA setup on UART is completed

Regards,
Amit Pundir

> Fixes: e668eb1e1578 ("Bluetooth: hci_core: Don't stop BT if the BD address missing in dts")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  net/bluetooth/hci_sync.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index c2a805ee55cc..ce03038b3460 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -4615,16 +4615,14 @@ static int hci_dev_setup_sync(struct hci_dev *hdev)
>          * BD_ADDR invalid before creating the HCI device or in
>          * its setup callback.
>          */
> -       invalid_bdaddr = test_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
> -
> +       invalid_bdaddr = test_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks) ||
> +                        test_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
>         if (!ret) {
>                 if (test_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks) &&
>                     !bacmp(&hdev->public_addr, BDADDR_ANY))
>                         hci_dev_get_bd_addr_from_property(hdev);
>
> -               if ((invalid_bdaddr ||
> -                    test_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks)) &&
> -                   bacmp(&hdev->public_addr, BDADDR_ANY) &&
> +               if (invalid_bdaddr && bacmp(&hdev->public_addr, BDADDR_ANY) &&
>                     hdev->set_bdaddr) {
>                         ret = hdev->set_bdaddr(hdev, &hdev->public_addr);
>                         if (!ret)
> --
> 2.39.3
>
