Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77537443D
	for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 16:47:25 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso7257393a12.3
        for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 09:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1689094043; x=1691686043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U2CJtNA/0mITyVD5x12gejKNioPrhHv1tiOXdLtkt0Q=;
        b=ObrABwSFDtsB2XhWl21K2EkSbkTsHpx4WVVBaD9YL0kdqdrWPHsvinDUIErZN0YtuZ
         nOPUTpzks5d+m4SZBPhAkanFfxTmaGJT3pGakD405Ib75srXi8ZAK8/bwECEFHAEhfrc
         dwREnb0+4nZk7z9M2GGNeNFDZ+OvgL+S74G2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689094043; x=1691686043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2CJtNA/0mITyVD5x12gejKNioPrhHv1tiOXdLtkt0Q=;
        b=DrO6EF2a2mYwrJQZvCm/FLKgZ5udxh01/RNigRqsctE4wWjLkOX9iPbRJ5mstfkFt0
         H/5OvhLlmGBBX5sPg1TSCgPW47FWTzp8D1YVv6cAiOIc+9qYCDL0GM3vnNHWpfI8iN2w
         zKPBrJ2oy2V2IwO4Kb8SWIft1tCWyZP4N9W3Scym9H6gj72TGpsXzipWIESouy9I7Dsy
         o8ip6TPlSyuY1k3nZkz512ByrAY1h+mJTGwUSymwymr7mbbbwi9G3pUgrjmo+bxh8DJ5
         u1ScPNutdIpROXMYoR8E2ExRsRDUQmJtXLVFDuR27NOB25BNH53RWMXa58ysv9EGGTD9
         rOdg==
X-Gm-Message-State: ABy/qLaBBaXZvm0eqrSzecUhCqnx5NZG0CjbgkCW4P3o6h51W2jZN+JL
	9nlJTZA9RpTgKNrrfMEWXMBVvXX6Qartu4e8/pajyW0b
X-Google-Smtp-Source: APBJJlG7w4dfX5XFeYDNXO5ZEWutQUXT+BGQm6F9/iiFTwVeOi4ERDNF3RwCR5uQAu6NQEjLv5be1w==
X-Received: by 2002:a05:6402:5158:b0:51e:34a1:8bf7 with SMTP id n24-20020a056402515800b0051e34a18bf7mr13609798edd.39.1689094043374;
        Tue, 11 Jul 2023 09:47:23 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id h14-20020aa7de0e000000b0051e0cb4692esm1478498edv.17.2023.07.11.09.47.23
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 09:47:23 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-51e48e1f6d1so4594479a12.1
        for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 09:47:23 -0700 (PDT)
X-Received: by 2002:aa7:d052:0:b0:51e:2a57:1d93 with SMTP id
 n18-20020aa7d052000000b0051e2a571d93mr13616464edo.16.1689094037813; Tue, 11
 Jul 2023 09:47:17 -0700 (PDT)
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
In-Reply-To: <20230711120609.GB27050@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 11 Jul 2023 09:47:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=whXh9sgLo24RO02JjfD0m3HE5NADRPWoEd+dW6bruFhVA@mail.gmail.com>
Message-ID: <CAHk-=whXh9sgLo24RO02JjfD0m3HE5NADRPWoEd+dW6bruFhVA@mail.gmail.com>
Subject: Re: Fwd: Need NVME QUIRK BOGUS for SAMSUNG MZ1WV480HCGL-000MV
 (Samsung SM-953 Datacenter SSD)
To: Christoph Hellwig <hch@lst.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Pankaj Raghav <p.raghav@samsung.com>, 
	Keith Busch <kbusch@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Sagi Grimberg <sagi@grimberg.me>, "Clemens S." <cspringsguth@gmail.com>, 
	Martin Belanger <martin.belanger@dell.com>, Chaitanya Kulkarni <kch@nvidia.com>, 
	John Meneghini <jmeneghi@redhat.com>, Hannes Reinecke <hare@suse.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux NVMe <linux-nvme@lists.infradead.org>, 
	Kanchan Joshi <joshi.k@samsung.com>, Javier Gonzalez <javier.gonz@samsung.com>, 
	=?UTF-8?B?67CV7KeE7ZmY?= <jh.i.park@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Jul 2023 at 05:06, Christoph Hellwig <hch@lst.de> wrote:
>
> As far as I can tell Windows completely ignores the IDs.  Which, looking
> back, I'd love to be able to do as well, but they are already used
> by udev for the /dev/disk/by-id/ links.   Those are usually not used
> on desktop systems, as they use the file system labels and UUIDs, but
> that doesn't work for non-file system uses.

The thing is, the nvme code seems to actively do completely stuipid
things in this area.

> And all this has been working really well with the good old enterprise
> SSDs, it's just that the cheap consumer devices keep f*cking it up.

Christoph, deal with reality, not with what you think things should look like.

Anybody who expected unique ID's is frankly completely incompetent.
People should have *known* not to do this.

 "Those Who Do Not Learn History Are Doomed To Repeat It"
          - Santayana

and we have NEVER EVER seen devices with reliably unique IDs. Really.
We've had these uuid's before (ask Greg about USB devices one day, and
that was *recent*).

We've always known that vendors will fill in a fixed value, and
somebody still decided to make this a correctness issue?

Christoph, don't blame vendors. Somebody did indeed f*ck up.  But it was you.

> If we'd take it away now we'd break existing users, which puts us between
> a rock and a hard place.

Well, here's a suggestion: stop making it worse.

For example, we have this completely unacceptable garbage:

        ret = nvme_global_check_duplicate_ids(ctrl->subsys, &info->ids);
        if (ret) {
                dev_err(ctrl->device,
                        "globally duplicate IDs for nsid %d\n", info->nsid);
                nvme_print_device_info(ctrl);
                return ret;
        }

iow, the code even checks for and *notices* that there are duplicate
IDs, and what does it do? It then errors out.

Then expecting people TO WAIT FOR A NEW KERNEL VERSION when you
noticed something wrong? What an absolute crock.

So stop blaming anybody else.

I think the code should *default* to "unreliable uuid", and then if
you're sure it's actually ok, then you use it. Then some rare
enterprise user with multipathing  - who is going to be very very
careful about which device to use anyway - can use the "approved
list".

Or "Oh, I noticed a non-unique UUID, let me generate one for you based
on physical location".

But this "my disk doesn't work in v6.0 and later because some clown
added a duplicate check that shouldn't be there" is not a good thing
to then try to make excuses for.

            Linus
