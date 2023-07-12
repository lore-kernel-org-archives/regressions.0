Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D114F95
	for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 16:52:12 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b6f943383eso117145191fa.2
        for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 09:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1689180730; x=1691772730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oAuCX7b/d1hbHKp+310Sb1Zp5QGgY2qfzYziff3Pm1c=;
        b=U5ONKyp89d8LjT1vJe3usI67MT+9QxOmfVCOnV8Qu1V72IlaDhrnb03Zsqn440Rr4M
         B2fBHx4diBfDXv+wMUC7thn/86QRjglRTgYGshZRHvXSfInKy4w8SLCg8k7tPgXo0aOw
         FTpHc/9OLYlhJB4h56Lq2MX4SsudXF3Dy0Ws4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689180730; x=1691772730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAuCX7b/d1hbHKp+310Sb1Zp5QGgY2qfzYziff3Pm1c=;
        b=NnTGNcSXvGiTD7yMRaE87hKPOrEucGcE69uv8lBo0B+vHbWdoX4hwPz+NW6dz5EOsV
         5Ozh6Q0vNdmp+OVXxMlcKfHr6ul1xPtMRinaITjjoH6e5BZ6wX33/WSKDhY6ehFegDE3
         /7mY0iD3D3ZmJEIC4CsfdY7KjW1cCx+kl0/AEKr0QckMl5GEQ9prBDFf1zjBixk2MuY8
         0jwRSghyO+gnNvTi08NPSBRGG0FB9Incvq8Rf7PaeDZb0164lehAkuiT/bjf5qg1WvyV
         VN+LBeaZ2z8RQExqCIwYys4GxIQ3goGX+GDFy/l+QTcPl1W7nNfVNYbD7bBu6VspFO+O
         nakA==
X-Gm-Message-State: ABy/qLbX3MHKTn2xOdmR1eq0jaqqHsT3T61n9aGRvoHguWtOVM6EhEOw
	Se5GtmSF/F9eUyuQAidEGix/Q+1/Z/ehTSF+Kq0JgNsw
X-Google-Smtp-Source: APBJJlE7tpnHd3dC+tdtlwcUim+m5S5LB3QghzsLENfOgEBmdqR/HQPhVspKQI3ZvT11L55szs3XUw==
X-Received: by 2002:a2e:b041:0:b0:2b5:8a21:5627 with SMTP id d1-20020a2eb041000000b002b58a215627mr17300611ljl.51.1689180730442;
        Wed, 12 Jul 2023 09:52:10 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id r8-20020a2eb608000000b002b69a4904adsm1051066ljn.20.2023.07.12.09.52.09
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 09:52:09 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fb94b1423eso11058969e87.1
        for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 09:52:09 -0700 (PDT)
X-Received: by 2002:a05:6512:3090:b0:4f8:4512:c844 with SMTP id
 z16-20020a056512309000b004f84512c844mr19547117lfd.48.1689180728994; Wed, 12
 Jul 2023 09:52:08 -0700 (PDT)
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
 <CAHk-=whXh9sgLo24RO02JjfD0m3HE5NADRPWoEd+dW6bruFhVA@mail.gmail.com> <20230712164546.GA31434@lst.de>
In-Reply-To: <20230712164546.GA31434@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 12 Jul 2023 09:51:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=whA9rmvNfo=8iKmtimayiA2Aus4XvPwcDrA53G2rfGP0w@mail.gmail.com>
Message-ID: <CAHk-=whA9rmvNfo=8iKmtimayiA2Aus4XvPwcDrA53G2rfGP0w@mail.gmail.com>
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

On Wed, 12 Jul 2023 at 09:45, Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Jul 11, 2023 at 09:47:00AM -0700, Linus Torvalds wrote:
>
> > and we have NEVER EVER seen devices with reliably unique IDs. Really.
>
> Sorry, but that's bullshit.

Christoph, you are *literally* involved in a discussion where this is the case.

What you call "bullshit" is what everybody else here calls REALITY.

The fact that *some* devices have serial numbers in no way implies
that all of them do.

And if you think that they all do, you are the problem. Literally in this case.

So you had better really internalize this "there are no reliable
serial numbers in general". Because it's simply a FACT.

> Well, let's try something like this (co-developed with Sagi) that
> allows it for non-multipath PCIe devices, which covers the quirks
> we've added so far, but also add a big fat warning, because we know
> people rely on the /dev/disk/by-id/ links.  Probably not on these
> devices, but who knows.

Looks sane to me.

          Linus
