Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9425372
	for <regressions@lists.linux.dev>; Mon,  9 Aug 2021 19:18:14 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id r19-20020a0568301353b029050aa53c3801so2236185otq.2
        for <regressions@lists.linux.dev>; Mon, 09 Aug 2021 12:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hYZobW9xK36rT9yB0IPzns8tP1S5tN4tBdCdd+rZbco=;
        b=DLMQQOoQQu5lBpQ24jAmJ3slau9XmuLEcwl3O+XA3ej8DNVT1wlX/VIgqXWCT4W6Wo
         Kf2H4npv3PLDJ81XnhRmmRyrTZttbQZe4qJfMJdr4jKM+fWdIvtGrH6gLG9+cKSJCFWp
         n8Z9SBo8e+WzL0W5wthcF+LBDqfuaPzKsPGiEOGQuwhi92k5EiXA5fr7PBuZgFNaZYO/
         6GfqmtDxi9R4r9Mcs25cw63fV8/5gMMtHLU/GaBI81w0AYOIti41UQojtduOjsKeWzOu
         LWC2bzwPgo76VHPAvnEEoWH7NPKjS6mZqrkrmfP+X5dpnjaxM8Vp4XJgGfAeYF7c9VLF
         AM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=hYZobW9xK36rT9yB0IPzns8tP1S5tN4tBdCdd+rZbco=;
        b=iDGW/xRPa4o2zv8rIK9MBHCPR2kYgCxEqP/QAVQUG0UwzmyEoaQVf1BPzF2Ig9szbK
         Nul7VbIK9xrhzcZmrpb1soKoVN5BKXQQea7twkN4OKN0Ct0xoEkyrNqk7+1K5mHHGeXM
         2ESFQzIMdCAngMeVHsbcxkEWEbp84YFZN1krx0c0nFD1w36uLJXB+ODcBBqHLumyK/v4
         d1SP6tjeaw2VxD/+IwMUo3RIiQcuQtHqMGbbMo85Joa3XqUtOmm3PzySkD+WqhQUlGHT
         d6EbKzk+ll72JtxVL6C2fnoBQ7QNXqfZ8l9yu4TaL1HjSETaUMapsUuF7s9D8cHw3vP/
         J5BQ==
X-Gm-Message-State: AOAM533AFcRMlNfX2c50wJYZKSHDoW7wUT9tpzes3tJ5Q4ZQI+3FUlcT
	3jDd8Y6y4xnBmAL0zyegfiE=
X-Google-Smtp-Source: ABdhPJzofvN2vrpxmWsNsDSauT3UKFwazf5OeU9t8HjglHo0wI5vSPmBXyEE316Fim/1+0bMoJ0Obw==
X-Received: by 2002:a05:6830:418f:: with SMTP id r15mr17294824otu.134.1628536693824;
        Mon, 09 Aug 2021 12:18:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n1sm3400681otk.34.2021.08.09.12.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 12:18:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Aug 2021 12:18:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: regressions@lists.linux.dev, stable <stable@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marcel Holtmann <marcel@holtmann.org>
Subject: Re: regression: Bluetooth interface broken on systems with Mediatek
 CPU
Message-ID: <20210809191811.GA1467958@roeck-us.net>
References: <a9cd03da-b816-eed3-7e77-d539924cbe88@roeck-us.net>
 <CAAd53p4r5_Hvnt-v0imb1Q6fQaMmRvw-skRdrTAh-GmgegBCdg@mail.gmail.com>
 <20210809041025.GA2968009@roeck-us.net>
 <CAAd53p7b_uHGqx5FT-s=8+M+PZVREX=3igEsGRgR4JL-TK64QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd53p7b_uHGqx5FT-s=8+M+PZVREX=3igEsGRgR4JL-TK64QA@mail.gmail.com>

On Mon, Aug 09, 2021 at 12:48:16PM +0800, Kai-Heng Feng wrote:
> Hi Guenter,
> 
> On Mon, Aug 9, 2021 at 12:10 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Mon, Aug 09, 2021 at 10:35:34AM +0800, Kai-Heng Feng wrote:
> > > On Sat, Aug 7, 2021 at 6:22 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > [ Greg asked me to submit a report to regressions@, so here it is. ]
> > > >
> > > > The following error was observed on Chromebooks with MT8183 CPU
> > > > (ASUS Chromebook Detachable CM3, HP Chromebook 11a, and others):
> > > >
> > > > [  224.735198] Bluetooth: qca_setup() hci0: setting up ROME/QCA6390
> > > > [  225.205024] Bluetooth: qca_read_soc_version() hci0: QCA Product ID   :0x00000008
> > > > [  225.205040] Bluetooth: qca_read_soc_version() hci0: QCA SOC Version  :0x00000044
> > > > [  225.205045] Bluetooth: qca_read_soc_version() hci0: QCA ROM Version  :0x00000302
> > > > [  225.205049] Bluetooth: qca_read_soc_version() hci0: QCA Patch Version:0x000003e8
> > > > [  225.205055] Bluetooth: qca_uart_setup() hci0: QCA controller version 0x00440302
> > > > [  225.205061] Bluetooth: qca_download_firmware() hci0: QCA Downloading qca/rampatch_00440302.bin
> > > > [  227.252653] Bluetooth: hci_cmd_timeout() hci0: command 0xfc00 tx timeout
> > > > ...
> > > > [  223.604971] Bluetooth: qca_recv() hci0: Frame reassembly failed (-84)
> > > > [  223.605027] Bluetooth: qca_recv() hci0: Frame reassembly failed (-84)
> > > > (repeated several times)
> > > > ...
> > > >
> > > > The Bluetooth interface on those Chromebooks can not be enabled.
> > > >
> > > > Bisect suggests that upstream commit 0ea9fd001a14 ("Bluetooth: Shutdown
> > > > controller after workqueues are flushed or cancelled") introduced the problem.
> > > > Reverting it fixes the problem.
> > > >
> > > > The problem was also reported at [1] on a Mediatek Pumpkin board.
> > > >
> > > > As of this writing, the problem is still present in the upstream kernel
> > > > as well as in all stable releases which include commit 0ea9fd001a14.
> > >
> > > Thanks. Can you please test the following patch:
> > >
> > I would love to, but I am unable to apply the patch. It failed to apply
> > to mainline, to linux-next, and to all stable releases I tried.
> 
> I think it has something to do with how the code gets pasted to the mail client.
> So can you please give this a try:
> https://paste.ubuntu.com/p/CsRrQWNYKr/
> 
That is different to the patch you just submitted. I assume that patch is
the final version. I assume that is the final version. Since it was already
tested, I'll stop testing this one.

Guenter

> Kai-Heng
> 
> >
> > Guenter
> >
> > > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > > index 2560ed2f144d4..131e69a9a66a0 100644
> > > --- a/net/bluetooth/hci_core.c
> > > +++ b/net/bluetooth/hci_core.c
> > > @@ -1757,6 +1757,14 @@ int hci_dev_do_close(struct hci_dev *hdev)
> > >                         cancel_delayed_work_sync(&adv_instance->rpa_expired_cb);
> > >         }
> > >
> > > +       if (!hci_dev_test_flag(hdev, HCI_UNREGISTER) &&
> > > +           !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
> > > +           test_bit(HCI_UP, &hdev->flags)) {
> > > +               /* Execute vendor specific shutdown routine */
> > > +               if (hdev->shutdown)
> > > +                       hdev->shutdown(hdev);
> > > +       }
> > > +
> > >         /* Avoid potential lockdep warnings from the *_flush() calls by
> > >          * ensuring the workqueue is empty up front.
> > >          */
> > > @@ -1798,14 +1806,6 @@ int hci_dev_do_close(struct hci_dev *hdev)
> > >                 clear_bit(HCI_INIT, &hdev->flags);
> > >         }
> > >
> > > -       if (!hci_dev_test_flag(hdev, HCI_UNREGISTER) &&
> > > -           !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
> > > -           test_bit(HCI_UP, &hdev->flags)) {
> > > -               /* Execute vendor specific shutdown routine */
> > > -               if (hdev->shutdown)
> > > -                       hdev->shutdown(hdev);
> > > -       }
> > > -
> > >         /* flush cmd  work */
> > >         flush_work(&hdev->cmd_work);
> > >
> > >
> > > >
> > > > Thanks,
> > > > Guenter
> > > >
> > > > ---
> > > > [1] https://lkml.org/lkml/2021/7/28/569
