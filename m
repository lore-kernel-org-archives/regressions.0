Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F667256E
	for <regressions@lists.linux.dev>; Fri, 13 May 2022 23:52:43 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id w17-20020a17090a529100b001db302efed6so9120265pjh.4
        for <regressions@lists.linux.dev>; Fri, 13 May 2022 16:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TbLxl33dnNUr+TfDuWRFuOGQ2ZUPcmVlTIUSDlM0UtY=;
        b=LvtLnKdSQtIB/h9rHwla9pGnn6N0ZEdEyvepL2LfW2VFElLW6Til2qwJC+KSXazcci
         d8MnCvcg5UrV29AkYPedleERALvTUaDfBCmFuD9FcaY6DSRoTmi9vVyCcSBsN8v4pGJ6
         SK451D4v0E+Q9zPgmqa99IbKp55zpPqo1mIynYK0qNP720tJJ8LKiuujm8FUXtv1MLPn
         I7paDihgFHXG7xpJNm2Flq33FDnwhC69gPt273M/vaOzdBGCefiYA739SyOpoeUjxSV5
         fRoEkSzx6VZaOBZgQzUv8ugJLc5LsKkhP9aECMxHso8D0HulXg7hJAewSNrghIbNqOin
         fQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TbLxl33dnNUr+TfDuWRFuOGQ2ZUPcmVlTIUSDlM0UtY=;
        b=gKDlPPQyfaYovbNXjL6HWfxGrguDpehu9L9QjPPd+66eUQnRIqTSsEDtvPyhhiAHfJ
         758Mnmom5IJUsSgv5VuwfSi8k6INLOX8Ta279YZlP0UjtzxKteXe7ZMuV5OPL9lRL3Qg
         m0R5k3jWq9LjGZ+TWXb/TO85J632uSTaAkaMoJ1eJBIw1revsQtTSR706vWq6ppsT9BS
         9mOE+4rXhqEgt7Go1bILDqW12tZcL4xrwdPm68o5yFfvZW57DsppzidZGo37F5OKhfjY
         TOwGWvTE/6QF6NkF8g5HCTPDvNfGn8QdjwmS9esYvyN1cawmX48p3Q8CgM5qk0xuImK+
         NkbQ==
X-Gm-Message-State: AOAM531sQRtCcMdYEf3d7jZAfTyn9jjd48SHBxQg9YZNmvJ8IFjtt7s/
	60qFdJQQPQOfTA7xJXDW8lNFiXZWw0rH9vOoUlo=
X-Google-Smtp-Source: ABdhPJxod8TJZrh+tnAE7g6NarDMwEyTFMdZu3pNgPIb3/P2wLbP4GlL359WHn++m6K2GAv+djW4wHm3Ub6YSHUXq60=
X-Received: by 2002:a17:90a:528f:b0:1dc:9a7c:4a3 with SMTP id
 w15-20020a17090a528f00b001dc9a7c04a3mr7194958pjh.112.1652485962851; Fri, 13
 May 2022 16:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a1ce1743-e450-6cdb-dfab-56a3e3eb9aed@pengutronix.de> <CABBYNZ+z8kBUKGXbZSfb0ynJaTnPQRp0wFDUb12AW1ymbNx1eg@mail.gmail.com>
In-Reply-To: <CABBYNZ+z8kBUKGXbZSfb0ynJaTnPQRp0wFDUb12AW1ymbNx1eg@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 13 May 2022 16:52:31 -0700
Message-ID: <CABBYNZ+zsuggTpaUSPsZKeL=qqvM1=sgMWzdWEqaS_oh6dhY2g@mail.gmail.com>
Subject: Re: [BUG] BLE device unpairing triggers kernel panic
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Ahmad,

On Fri, May 13, 2022 at 1:14 PM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Ahmad,
>
> On Fri, May 13, 2022 at 7:10 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >
> > Hello,
> >
> > On Linux v5.18-rc5, I can reliably crash the kernel on the second (un)pairing
> > with a customer's BLE device. I have bisected the issue and found two commits:
> >
> > - Commit 6cd29ec6ae5e ("Bluetooth: hci_sync: Wait for proper events when
> >   connecting LE") causes previously working pairing to time out, presumably
> >   because it keeps waiting for the wrong event.
>
> Can you describe in more details what is the second pairing, are you
> pairing 2 devices concurrently? I recall someone for nxp having
> similar problem, at least the traces look pretty similar, the problem
> seems to be the expected event don't match the event the controller
> send, in this case hci_le_enh_conn_complete_evt, so hci_event process
> it and frees the hci_conn instead of first running the callback.

Looks like my memory failed me on this one, the sync callback is run
last so we shouldn't cleanup the hci_conn at that point, perhaps
something like the following should fix the crash:

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 0270e597c285..c1634af670b8 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5632,10 +5632,8 @@ static void le_conn_complete_evt(struct hci_dev
*hdev, u8 status,
                status = HCI_ERROR_INVALID_PARAMETERS;
        }

-       if (status) {
-               hci_conn_failed(conn, status);
+       if (status)
                goto unlock;
-       }

        if (conn->dst_type == ADDR_LE_DEV_PUBLIC)
                addr_type = BDADDR_LE_PUBLIC;

> > - Commit a56a1138cbd8 ("Bluetooth: hci_sync: Fix not using conn_timeout")
> >   fixes, despite the title, what event is waited on. First Pairing works now,
> >   but the second pairing times out and crashes the kernel:
> >
> >   [   84.191684] Bluetooth: hci0: Opcode 0x200d failed: -110
> >   [   84.230478] Bluetooth: hci0: request failed to create LE connection: err -110
> >   [   84.237690] Unable to handle kernel read from unreadable memory at virtual address 0000000000000ca8

That said the error -110 mean -ETIMEDOUT



--
Luiz Augusto von Dentz
