Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1984E14F99
	for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 16:48:48 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso11577026e87.1
        for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1689180527; x=1691772527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oMWZAChJYV60SmdxsBdiqmGcST+PLRNcYlCxSrWksj0=;
        b=gB4jVVbrbetwHrk7VCC2mz3twdKV2Z0lEZ8MH1gjnM8UgO6ctbIBbxe+5nk5D66yHA
         ODH92rB8R2pxgtOfPqPVij/ibJa3/lI9C04nktlADUgnCRaWg196YguXL7GqxSkNwiaD
         pI8rQYDa5NWIv7DFfB+kRdzAO2bEeVCSP5Ebg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689180527; x=1691772527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMWZAChJYV60SmdxsBdiqmGcST+PLRNcYlCxSrWksj0=;
        b=Ct+XQEjVic0OdAuC6j6Nxz/7DeMy/jzFkX/+w13cW70Oc9DK8w/7w7SJKr/sUQmUJb
         p5TwnItU9HEBIALZhMcU8OYtOGU6xIH0HN6y1vq8JRN7+j53//W0hDrOwakx/avZnfUX
         EMFktRSQmLVPiuZAjTMg+1JAIY5EnmJnFoauYFRcl/6bdN/QAqLwvms24f+cA1sqOLWr
         59VPgVfLkVxZEyjVw0z5A1RRkFF4m1Ry6/zgMsOJXiaC57UPGihH3nciwatoP/ze86ql
         g8k+bQ6DAYINHFa91Hd+oybnnqECufEs4PmiQVFtiZWf05sgMZTa69Kj+bkheGQJorMK
         jaUg==
X-Gm-Message-State: ABy/qLaBKu927KovWG2j3nTxgCKWad/GV8udPPmAQYwhm/3aO7YyB/ZG
	x6+EQ1VlZ4PZG2DmajRl3CS/CnVeFntvbMl67dYocRNt
X-Google-Smtp-Source: APBJJlE/djhahHNPAbNByH5EsPnZcJD0oMJHk0QW7eU63srBbd/Skw+1yVQQ5x81qcxTC1ZtupmEsw==
X-Received: by 2002:a05:6512:220e:b0:4fb:c0d8:10ec with SMTP id h14-20020a056512220e00b004fbc0d810ecmr19850992lfu.1.1689180526729;
        Wed, 12 Jul 2023 09:48:46 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id d16-20020ac25ed0000000b004fb88c1ab18sm782404lfq.182.2023.07.12.09.48.45
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 09:48:46 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso11576989e87.1
        for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 09:48:45 -0700 (PDT)
X-Received: by 2002:ac2:5f01:0:b0:4fa:6d62:9219 with SMTP id
 1-20020ac25f01000000b004fa6d629219mr14025309lfq.62.1689180525640; Wed, 12 Jul
 2023 09:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d18d2a08-9d24-0209-c2cf-baf60bbf5048@gmail.com>
 <ZJsKBkPqoWzYyngS@kbusch-mbp.dhcp.thefacebook.com> <6f333133-2cc4-406a-d6c2-642ac6ccabca@leemhuis.info>
 <CGME20230710155902eucas1p2b464a29adc35e983c73b00d18ab5344c@eucas1p2.samsung.com>
 <ZKwqvTMPVmhnkZjS@kbusch-mbp.dhcp.thefacebook.com> <f0fdf86e-4293-8e07-835d-b5a866252068@samsung.com>
 <462e0e1e-98ea-0f3c-4aaa-8d44f0a8e664@leemhuis.info> <20230711120609.GB27050@lst.de>
 <CAHk-=whXh9sgLo24RO02JjfD0m3HE5NADRPWoEd+dW6bruFhVA@mail.gmail.com>
 <ZK2PgNizcMLW+S/V@kbusch-mbp.dhcp.thefacebook.com> <f0e8de7b-655c-9932-16d4-105decff9a6c@grimberg.me>
In-Reply-To: <f0e8de7b-655c-9932-16d4-105decff9a6c@grimberg.me>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 12 Jul 2023 09:48:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=whhGcG5vuzWMOpy0fE6MYD6V_H7aWLU1wf=RSJV8y=9FA@mail.gmail.com>
Message-ID: <CAHk-=whhGcG5vuzWMOpy0fE6MYD6V_H7aWLU1wf=RSJV8y=9FA@mail.gmail.com>
Subject: Re: Fwd: Need NVME QUIRK BOGUS for SAMSUNG MZ1WV480HCGL-000MV
 (Samsung SM-953 Datacenter SSD)
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Pankaj Raghav <p.raghav@samsung.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	"Clemens S." <cspringsguth@gmail.com>, Martin Belanger <martin.belanger@dell.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, John Meneghini <jmeneghi@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux NVMe <linux-nvme@lists.infradead.org>, 
	Kanchan Joshi <joshi.k@samsung.com>, Javier Gonzalez <javier.gonz@samsung.com>, 
	=?UTF-8?B?67CV7KeE7ZmY?= <jh.i.park@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jul 2023 at 00:38, Sagi Grimberg <sagi@grimberg.me> wrote:
>
> Perhaps we could fallback to what we do in wwid_show()?
>
> "nvme.%04x-%*phN-%*phN-%08x\n", subsys->vendor_id, serial_len,
> subsys->serial, model_len, subsys->model, head->ns_id)

That's not going to be any more unique.

Yes, there is *slightly* more hope that a simpler "serial number"
might be different between devices, but honestly, when I told
Christoph to learn from history and not assume UUID's are unique for
hardware, that "history" is literally decades of serial numbers.

Why do you think things like dm/md generate the UUID and literally
write it to disk? It's because those unique serial numbers have never
ever existed.

And absolutely NONE OF THIS IS NEW. This is not a nvme issue. SCSI
disks allegedly has a VPD page 0x80 with a serial number. Not only
won't many devices report that VPD in the first place, even if they do
there's no guarantee that it's actually unique.

And USB devices are *supposed* to have unique device serial numbers
("iSerial"). I think it's literally been in the spec since day#1. And
some even do. Quite a lot absolutely do NOT.

It's just fundamentally cheaper for hardware manufacturers that do
mass manufacturing to do completely identical pieces of hardware.
Serial numbers and UUID's are _fundamentally_ hard and expensive at
some level.

If you sell overpriced garbage to enterprise users, then a serial
number or UUID will most definitely be part of the package. Because
that is _literally_ what "Enterprise hardware" means: "Overpriced
garbage with a provenance and somebody else to blame".

But if you sell to the mass market, and aren't going for people who
pay extra for provenance, a serial number or a UUID is pure overhead.

Sometimes it's easy enough to do, and people do it.

But if you *rely* on it, *you* are the problem. Not the vendor that
was churning out a million devices for real users, and that was
spending all the effort on just making it work.

Basically, I think all of these things are purely for fabrics and the
nvme target side.

Expecting serial numbers from a PCIe device is pure fantasy.

And, more importantly, it's stupid and wrong. Exactly because we've
been here before. Don't repeat mistakes from the past.

By all means _report_ things like serial numbers. They can be very
useful for tracking. But never *ever* rely on them for basic
functionality. People absolutely will have two identical devices from
the same batch, and unless there is some actual hardware compliance
verification, they will not have unique serial numbers.

In many cases, the best you can hope for is that the duplicate ones
are *obviously* duplicate (ie "all zeroes" and similar). But you
shouldn't expect or depend on even that to be the case.

             Linus
