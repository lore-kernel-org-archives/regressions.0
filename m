Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E545E3FC7
	for <regressions@lists.linux.dev>; Sun, 26 Sep 2021 08:44:06 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id i23so41711216wrb.2
        for <regressions@lists.linux.dev>; Sun, 26 Sep 2021 01:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aAFBCyjtuhLNOn+PcDwnYELkSeoZGc5qwL1Br1bF/Co=;
        b=KVsweAk5Ftv7Plagiy1hZ+d8ptvF1xnljhGR39k6v8J0fQ36aLZxcgnsdLdQOMii78
         XMRQIHi5PbzHpCtVMLYv62jrpVnMmorGhnNGnSr5TvBPhqWDHrbjBaOfUj1iSgos2MSy
         +uQpyjFSb6A5gmAYoIRrA+SHly/gCWhcN/1v6cqpKfiK8Ile0s1ZT3NAvfBIMKnr/og+
         TU3AxmmUJ1Gc7EeVF0OfwWqTM+qISzpXNm7MqnQMPg24b7WFU7AYdqGXCZUJiBxSayd6
         SHMcU6ojuyfhyI6YDgyuLSG1EU7hFt5MYp8Pe89hC95a0tRA5jUEMRe6co7Be7w5OIyz
         FLOg==
X-Gm-Message-State: AOAM530mfq/I/iRB77u3Wb5ktupGi4xDlXr/xDM3X3tkkaCd+eGJxUwr
	dBT3ofCEFg//RqHb0fi3xIA=
X-Google-Smtp-Source: ABdhPJxPIy/7nnROozAnKEdQt1srpKLaC+qnjXQbjT4lVJRYGneCi6V2Y+SFC6wQ591TJ77HZo9JKw==
X-Received: by 2002:a05:600c:198c:: with SMTP id t12mr10510269wmq.128.1632645845252;
        Sun, 26 Sep 2021 01:44:05 -0700 (PDT)
Received: from [192.168.64.123] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id f17sm3196901wrm.83.2021.09.26.01.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Sep 2021 01:44:04 -0700 (PDT)
Subject: Re: [REGRESSION] nvme: code command_id with a genctr for
 use-after-free validation crashes apple T2 SSD
To: Aditya Garg <gargaditya08@live.com>,
 Orlando Chamberlain <redecorating@protonmail.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "hare@suse.de" <hare@suse.de>, "dwagner@suse.de" <dwagner@suse.de>,
 "hch@lst.de" <hch@lst.de>
References: <cjJiSFV77WM51ciS8EuBcdeBcv9T83PUB-Kw3yi8PuC_LwrrUUnQ3w5RC1PbKvSYE72KryXp3wOJhv4Ov_WWIe2gKWOOo5uwuUjbbFA8HDM=@protonmail.com>
 <20210925171618.GA116968@dhcp-10-100-145-180.wdc.com>
 <fa9de055-c3b8-20d3-41e0-12e43d0c336a@protonmail.com>
 <20210926020839.GA96176@C02WT3WMHTD6>
 <1a6f5030-27d9-d1ae-aff4-0ed2a10dce6b@protonmail.com>
 <1b5d6bef-db6f-073f-8d24-4963f0df82ab@protonmail.com>
 <PNZPR01MB4415801C6084E8CFD068A84AB8A69@PNZPR01MB4415.INDPRD01.PROD.OUTLOOK.COM>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <d65ecc69-35c9-4400-8fb0-95aa04360b03@grimberg.me>
Date: Sun, 26 Sep 2021 11:44:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PNZPR01MB4415801C6084E8CFD068A84AB8A69@PNZPR01MB4415.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


> I checked out the proposal sent by Orlando Chamberlain to replace NVME_QUIRK_SHARED_TAGS , by NVME_QUIRK_SHARED_TAGS | given in the patch on http://lists.infradead.org/pipermail/linux-nvme/2021-September/027665.html. The , still causes panics to the T2 as described before. In the case of |, the kernel boots correctly without panicking the T2, but in case we are having Linux on an External Drive, which is my case, then the internal SSD doesn't seem to be recognised at all. I've tested the patch on 5.14.7.

That sounds like a separate issue, because with this patch applied,
all tags should be within the queue entry range (with generation
set to 0 always).

Is it possible that the io_queue_depth is being set to something
that exceeds NVME_PCI_MAX_QUEUE_SIZE (4095) ? the default is 1024
