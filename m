Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5734472
	for <regressions@lists.linux.dev>; Mon,  9 Aug 2021 04:10:28 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id t128so21855169oig.1
        for <regressions@lists.linux.dev>; Sun, 08 Aug 2021 21:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xouv+tb7vh+1b2FulveHrC4vYyemWDZdnWca7V+gIAo=;
        b=pqdtKseQ0uoK7bMYIIIIqkeQ70nLvidhW5gIJ1IP20/YYcaQJP84Op1AOJ8Zo0wCFW
         9CGjgyMNUf2+8c+6YqWNvbO6vDq6tnvAMZ7xrVEY3mPZOD0ivHGMMTYeypuP3ULLLgZu
         RIUtffLlYZCc1Duogiw3IzXz7zbKq4fwnUjdIDGg2/ttqoRlG0lm/DjdqBy2KavhnrNJ
         7rDpEYk/cMysAF6Dw3eA7IN2MpUfzo1O7VeNNNr0vobd7TPGilPL54PMN4dXJQUD8g5r
         6qtRFzOElbmkpdAolrVCmyc0bgxIp8dq7lyVKs/dICJQ1weBlyqm1ZlQIskC2Up1kUgd
         zccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=xouv+tb7vh+1b2FulveHrC4vYyemWDZdnWca7V+gIAo=;
        b=Qg6gAyMUe/q7+7FKWbqKm06bLvGzVg1benAtgn1NeLOJEkULGH5m/8iKGMy+nT4ndp
         yVOB5CXWXbJUtY6zCPOgxCR8g62aoyImoWJJLmSkPPpwKgG4I4pGbE0ByiJ870YlhUkc
         elxQtbxbaoxqsfO+irbtSMKQhrAU3aYIWWwqycpggu1AxarrLxty7y+F2HRQ9Yq/qBMC
         GWaQk0KYBGiZW8gM0GLOqO5TE+t92rcdI08BALc0lX49eYTsOGDccbiNY+WI/V7ojYFw
         dh1ksaltKoB1GMxJhx/OR3dOsOJAa/4mjGrPobbc/IjxgpBOS3pnxY5VQMh274/WYLSc
         +GGQ==
X-Gm-Message-State: AOAM531/JARnx51Bk4Ip8pJzdTyXhPuLabQ+9kUQR277PvP7otlJijHk
	mmUDG07k/rtmBPl17zoTAWc=
X-Google-Smtp-Source: ABdhPJxm2HX3RJgacxM3SbQ0l7CkxRsGHSHD8TsQ51E4Lzk56qfumnwNApwKcXeB2wRIuqesAvNziQ==
X-Received: by 2002:a05:6808:140e:: with SMTP id w14mr14692867oiv.32.1628482227533;
        Sun, 08 Aug 2021 21:10:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y5sm2980405otu.27.2021.08.08.21.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 21:10:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 8 Aug 2021 21:10:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: regressions@lists.linux.dev, stable <stable@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marcel Holtmann <marcel@holtmann.org>
Subject: Re: regression: Bluetooth interface broken on systems with Mediatek
 CPU
Message-ID: <20210809041025.GA2968009@roeck-us.net>
References: <a9cd03da-b816-eed3-7e77-d539924cbe88@roeck-us.net>
 <CAAd53p4r5_Hvnt-v0imb1Q6fQaMmRvw-skRdrTAh-GmgegBCdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd53p4r5_Hvnt-v0imb1Q6fQaMmRvw-skRdrTAh-GmgegBCdg@mail.gmail.com>

On Mon, Aug 09, 2021 at 10:35:34AM +0800, Kai-Heng Feng wrote:
> On Sat, Aug 7, 2021 at 6:22 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > [ Greg asked me to submit a report to regressions@, so here it is. ]
> >
> > The following error was observed on Chromebooks with MT8183 CPU
> > (ASUS Chromebook Detachable CM3, HP Chromebook 11a, and others):
> >
> > [  224.735198] Bluetooth: qca_setup() hci0: setting up ROME/QCA6390
> > [  225.205024] Bluetooth: qca_read_soc_version() hci0: QCA Product ID   :0x00000008
> > [  225.205040] Bluetooth: qca_read_soc_version() hci0: QCA SOC Version  :0x00000044
> > [  225.205045] Bluetooth: qca_read_soc_version() hci0: QCA ROM Version  :0x00000302
> > [  225.205049] Bluetooth: qca_read_soc_version() hci0: QCA Patch Version:0x000003e8
> > [  225.205055] Bluetooth: qca_uart_setup() hci0: QCA controller version 0x00440302
> > [  225.205061] Bluetooth: qca_download_firmware() hci0: QCA Downloading qca/rampatch_00440302.bin
> > [  227.252653] Bluetooth: hci_cmd_timeout() hci0: command 0xfc00 tx timeout
> > ...
> > [  223.604971] Bluetooth: qca_recv() hci0: Frame reassembly failed (-84)
> > [  223.605027] Bluetooth: qca_recv() hci0: Frame reassembly failed (-84)
> > (repeated several times)
> > ...
> >
> > The Bluetooth interface on those Chromebooks can not be enabled.
> >
> > Bisect suggests that upstream commit 0ea9fd001a14 ("Bluetooth: Shutdown
> > controller after workqueues are flushed or cancelled") introduced the problem.
> > Reverting it fixes the problem.
> >
> > The problem was also reported at [1] on a Mediatek Pumpkin board.
> >
> > As of this writing, the problem is still present in the upstream kernel
> > as well as in all stable releases which include commit 0ea9fd001a14.
> 
> Thanks. Can you please test the following patch:
> 
I would love to, but I am unable to apply the patch. It failed to apply
to mainline, to linux-next, and to all stable releases I tried.

Guenter

> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 2560ed2f144d4..131e69a9a66a0 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -1757,6 +1757,14 @@ int hci_dev_do_close(struct hci_dev *hdev)
>                         cancel_delayed_work_sync(&adv_instance->rpa_expired_cb);
>         }
> 
> +       if (!hci_dev_test_flag(hdev, HCI_UNREGISTER) &&
> +           !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
> +           test_bit(HCI_UP, &hdev->flags)) {
> +               /* Execute vendor specific shutdown routine */
> +               if (hdev->shutdown)
> +                       hdev->shutdown(hdev);
> +       }
> +
>         /* Avoid potential lockdep warnings from the *_flush() calls by
>          * ensuring the workqueue is empty up front.
>          */
> @@ -1798,14 +1806,6 @@ int hci_dev_do_close(struct hci_dev *hdev)
>                 clear_bit(HCI_INIT, &hdev->flags);
>         }
> 
> -       if (!hci_dev_test_flag(hdev, HCI_UNREGISTER) &&
> -           !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
> -           test_bit(HCI_UP, &hdev->flags)) {
> -               /* Execute vendor specific shutdown routine */
> -               if (hdev->shutdown)
> -                       hdev->shutdown(hdev);
> -       }
> -
>         /* flush cmd  work */
>         flush_work(&hdev->cmd_work);
> 
> 
> >
> > Thanks,
> > Guenter
> >
> > ---
> > [1] https://lkml.org/lkml/2021/7/28/569
