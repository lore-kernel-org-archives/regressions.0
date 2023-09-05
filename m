Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A73D30D
	for <regressions@lists.linux.dev>; Tue,  5 Sep 2023 16:28:51 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5009d4a4897so4602181e87.0
        for <regressions@lists.linux.dev>; Tue, 05 Sep 2023 09:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693931330; x=1694536130; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfYnmYbnlw/oOdEXRRJF1VOqzdakA8jCVvd4ZjMv2EM=;
        b=hgrmMOCenzX3mKKGMvkR5APfCYWmTcktdvG2qo662sRfR0tNku67dI1HO4EuVmVQWI
         UnwDkT7nWnP4zyjQFk1OVWV4PQRyqV0f3VqUugGRmBnpVWBjrgJjd6j0jM3a7jTsa+5q
         lT76w73fKcIUiYf5jIoh8ABvhNgfqaFoMlnIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693931330; x=1694536130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfYnmYbnlw/oOdEXRRJF1VOqzdakA8jCVvd4ZjMv2EM=;
        b=hEaJktDd8NxqvI5cAz52ut5jDiZtWnPXZybGPwUwDOgHruMb7Byf7j0Wf38VkIE8pC
         ApTOStwCuMzzVBWD5+QGqCOEdyYryVau0P58oW4CbWTb7UkUzh1Eahz2CiPXaGPL6Dvc
         ADBTXDtnpzEOy/08bR5skrbObuzsvfYLyU4OI+VVet7Xrr1qjhgYD94ttB2/wo4vs/Lb
         LP6+cE7GKzU7KIrK5FoFLayAbtpdbk63hQaPZAOcnq9A+D29S+vB3dpyNcH2sjsLtb8o
         Izjg/TfvFGNsMjUP3tttOWx5MyovCi84l5VMwg6rlfYLbz22Ofx4j2K9rUyAzfxBJqIF
         4OdA==
X-Gm-Message-State: AOJu0YyBkhcmrnET/lcwLf5ysIbXukXGpMzNJdcTmwG7/qAp20mw9VLN
	hGGtSyHDFWINOuP9QW6bPJsNOue1czBR9bbZK0kI
X-Google-Smtp-Source: AGHT+IHRpYJwtBkvQItpDOzpsoiC8Dj7/UWfHFdTNS2CIKeWgrIXNYkWJnDsvCEq1d6lrwFV0p0pXAjnk5zgzKOzDrQ=
X-Received: by 2002:ac2:5925:0:b0:500:b828:7a04 with SMTP id
 v5-20020ac25925000000b00500b8287a04mr259335lfi.18.1693931329871; Tue, 05 Sep
 2023 09:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <878r9sga1t.fsf@kernel.org>
In-Reply-To: <878r9sga1t.fsf@kernel.org>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Tue, 5 Sep 2023 17:28:38 +0100
Message-ID: <CAG7k0Epk6KJvoDJKVc86sc_ems3DTbKvPLouBzOoVvn1tZwQ=w@mail.gmail.com>
Subject: Re: [regression v6.5-rc1] PCI: comm "swapper/0" leaking memory
To: Kalle Valo <kvalo@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 10:21=E2=80=AFAM Kalle Valo <kvalo@kernel.org> wrot=
e:
>
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments=
 unless you have verified the sender and know the content is safe.
>
> Hi,
>
> I noticed that starting from v6.5-rc1 my ath11k tests reported several
> memory leaks from swapper/0:
>
> unreferenced object 0xffff88810a02b7a8 (size 96):
>   comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
>   hex dump (first 32 bytes):
>     80 b8 02 0a 81 88 ff ff b8 72 07 00 00 c9 ff ff  .........r......
>     c8 b7 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  ................
>   backtrace:
> unreferenced object 0xffff88810a02b880 (size 96):
>   comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
>   hex dump (first 32 bytes):
>     58 b9 02 0a 81 88 ff ff a8 b7 02 0a 81 88 ff ff  X...............
>     a0 b8 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  ................
>   backtrace:
> unreferenced object 0xffff88810a02b958 (size 96):
>   comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
>   hex dump (first 32 bytes):
>     30 ba 02 0a 81 88 ff ff 80 b8 02 0a 81 88 ff ff  0...............
>     78 b9 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  x...............
>   backtrace:
> unreferenced object 0xffff88810a02ba30 (size 96):
>   comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
>   hex dump (first 32 bytes):
>     08 bb 02 0a 81 88 ff ff 58 b9 02 0a 81 88 ff ff  ........X.......
>     50 ba 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  P...............
>   backtrace:
> unreferenced object 0xffff88810a02bb08 (size 96):
>   comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
>   hex dump (first 32 bytes):
>     e0 bb 02 0a 81 88 ff ff 30 ba 02 0a 81 88 ff ff  ........0.......
>     28 bb 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  (...............
>   backtrace:
>
> I can easily reproduce this by doing a simple insmod and rmmod of ath11k
> and it's dependencies (mac80211, MHI etc). I can reliability reproduce
> the leaks but I only see them once after a boot, I need to reboot the
> host to see the leaks again. v6.4 has no leaks.
>
> I did a bisect and found the commit below. I verified reverting the
> commit makes the leaks go away.
>
> commit e54223275ba1bc6f704a6bab015fcd2ae4f72572
> Author:     Ross Lagerwall <ross.lagerwall@citrix.com>
> AuthorDate: Thu May 25 16:32:48 2023 +0100
> Commit:     Bjorn Helgaas <bhelgaas@google.com>
> CommitDate: Fri Jun 9 15:06:16 2023 -0500
>
>     PCI: Release resource invalidated by coalescing
>
> Kalle
>

Hi Kalle,

I can't reproduce the leak by loading/unloading the ath11k module. I suspec=
t
that the leak is always there when PCI resources are coalesced but
kmemleak doesn't notice until ath11k is loaded.

Can you please try the following to confirm it fixes it?

Ross

8<-----------------------

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 8bac3ce02609..907c873473e2 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -998,6 +998,7 @@ static int pci_register_host_bridge(struct
pci_host_bridge *bridge)
         res =3D window->res;
         if (!res->flags && !res->start && !res->end) {
             release_resource(res);
+            resource_list_destroy_entry(window);
             continue;
         }
