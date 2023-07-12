Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA120F2
	for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 07:38:45 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3159adb7cb5so732896f8f.0
        for <regressions@lists.linux.dev>; Wed, 12 Jul 2023 00:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689147524; x=1691739524;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oChKme24SZPOA92hTi9VYNZ4RCh0CFOD0OdnxXjwR/I=;
        b=gfcJM3i4u3M4bvJcPSdjubVQ1VOB7lsMlmIXvrQkMEZPzulQurUppbOp5mJz/Bj9C/
         I/I5HFuWjwCnr8fYEdhgxOdY4r+YZ09EZi2wa2UFinh2WC+fD6BJQ9wsQwqaj1gcndmD
         yeFeBREMlYCbHzCkPPBnKH/I3Oj++agSFaxhiz+N0PB0FAikSEdLZ0U8nr0Czs3iopfw
         /C8SB8L5NBhAuwaaOSHEOdlNQ4vdYqeHDBZQJ+sqJT/+CR3dbTpoAy3CjDmAf4+IFV7D
         gnKLtyMvF9EBfOUtEbzZAEu+vowjwVGGcvlda/Wr2D6NIRGr0PpyPBO6Uyqt/57AvfNf
         Q9fg==
X-Gm-Message-State: ABy/qLYiIx0vnXJ31l7oWY01Rh9wYpBe6JM8k0Vyxvq9KhfionnhMfnx
	+tu8KnYkqXfmBkHrHEmzVuE=
X-Google-Smtp-Source: APBJJlFGYYhdLQYp1qY5RENlDfGjtleaBJ34hizcHHIjbEHqYhTrPpcNzYFzCgPsLN4VJw3meqaKNA==
X-Received: by 2002:a5d:4c85:0:b0:314:1d7f:9e9 with SMTP id z5-20020a5d4c85000000b003141d7f09e9mr17797032wrs.0.1689147523663;
        Wed, 12 Jul 2023 00:38:43 -0700 (PDT)
Received: from [192.168.64.192] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id f17-20020adffcd1000000b003140fff4f75sm4260000wrs.17.2023.07.12.00.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 00:38:43 -0700 (PDT)
Message-ID: <f0e8de7b-655c-9932-16d4-105decff9a6c@grimberg.me>
Date: Wed, 12 Jul 2023 10:38:40 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: Need NVME QUIRK BOGUS for SAMSUNG MZ1WV480HCGL-000MV
 (Samsung SM-953 Datacenter SSD)
Content-Language: en-US
To: Keith Busch <kbusch@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Pankaj Raghav <p.raghav@samsung.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, "Clemens S." <cspringsguth@gmail.com>,
 Martin Belanger <martin.belanger@dell.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, John Meneghini <jmeneghi@redhat.com>,
 Hannes Reinecke <hare@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux NVMe <linux-nvme@lists.infradead.org>,
 Kanchan Joshi <joshi.k@samsung.com>,
 Javier Gonzalez <javier.gonz@samsung.com>, =?UTF-8?B?67CV7KeE7ZmY?=
 <jh.i.park@samsung.com>
References: <d18d2a08-9d24-0209-c2cf-baf60bbf5048@gmail.com>
 <ZJsKBkPqoWzYyngS@kbusch-mbp.dhcp.thefacebook.com>
 <6f333133-2cc4-406a-d6c2-642ac6ccabca@leemhuis.info>
 <CGME20230710155902eucas1p2b464a29adc35e983c73b00d18ab5344c@eucas1p2.samsung.com>
 <ZKwqvTMPVmhnkZjS@kbusch-mbp.dhcp.thefacebook.com>
 <f0fdf86e-4293-8e07-835d-b5a866252068@samsung.com>
 <462e0e1e-98ea-0f3c-4aaa-8d44f0a8e664@leemhuis.info>
 <20230711120609.GB27050@lst.de>
 <CAHk-=whXh9sgLo24RO02JjfD0m3HE5NADRPWoEd+dW6bruFhVA@mail.gmail.com>
 <ZK2PgNizcMLW+S/V@kbusch-mbp.dhcp.thefacebook.com>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <ZK2PgNizcMLW+S/V@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> For example, we have this completely unacceptable garbage:
>>
>>          ret = nvme_global_check_duplicate_ids(ctrl->subsys, &info->ids);
>>          if (ret) {
>>                  dev_err(ctrl->device,
>>                          "globally duplicate IDs for nsid %d\n", info->nsid);
>>                  nvme_print_device_info(ctrl);
>>                  return ret;
>>          }
>>
>> iow, the code even checks for and *notices* that there are duplicate
>> IDs, and what does it do? It then errors out.
> 
> This check came from a recent half-baked spec feature called "Dispersed
> Namespaces" that caused breakage and data corruption when used in Linux.
> Rather than attempt to support that mostly vendor specific feature, the
> driver attempted to fence that off as unmaintainable. This check wasn't
> aimed at enforcing "correctness", but it certainly found a lot of that
> as collatoral damage. Let's see if we can find a better way to detect
> the difference with a sane fallback as you suggest.

Perhaps we could fallback to what we do in wwid_show()?

"nvme.%04x-%*phN-%*phN-%08x\n", subsys->vendor_id, serial_len,
subsys->serial, model_len, subsys->model, head->ns_id)
