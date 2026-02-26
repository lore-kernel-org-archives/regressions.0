Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8B444CAF6
	for <regressions@lists.linux.dev>; Thu, 26 Feb 2026 16:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123465; cv=none; b=Xg20Xqgu/V2MQNNtf5lGg9CPQUuntZ5sNxt5KfEFyH021WSXGg/pHrsmw5MJG/mk3yRD7I0ixsEBGV+T+PPzwlTX96IHs53b2kQH+EIe9d0DwMHhSlBQIQsCLZDVqnekXkJYHwzJoaluIhlTrvAnuFGCz2Bkjy8SE7LyMQQMKOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123465; c=relaxed/simple;
	bh=sRMSWEsQbVYqruDLWg50FVRfknHGCccs0DYH9B3QGnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTydCS73ZHE3BklLjXVbpEADLpKbpGBjgCou+F3nxw7EP5rVDMDF1zWrlSA/F4k2gp16YobYPVblF9irAOt6KTEWcRquKwx4gVwxH5XlozTEdBTg5ksYhqikJyxfbXt9Laep6oej5spVjgIejtoviFWXEKqiFqHhGhPjskwfdiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XqjYFZwI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XqjYFZwI"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4398ebdf4c2so37081f8f.2
        for <regressions@lists.linux.dev>; Thu, 26 Feb 2026 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772123462; x=1772728262; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54084A4OEdYJ/FduLbr67Sj+jCec7nOyoBihp7G/XDQ=;
        b=XqjYFZwI6m1knSSFV6Ud7u2riSJO7ZvZ6SrAx1DVUULtA+BPW/nDhindUKVBzmtUr3
         VLVSMmMI6sIM1LB1Th+ojxgoYwF4466ptSjuIujxYsRSLSwwT7z43XG8KlfxCy5GhH8o
         lacSL0GZZDV2YWTf766mFDP5Ycbd2feh/mcmzNkSQW94MIBF5O+SJTkLRzjd25SlXxE9
         AxHj3GmqmK0QG2tS2s4enYLS7yoODn/rHdOoz96do58JdEmBYHbPx17RTZjE3nKp8CV6
         IuCAG4jibZy322cpKrhV7t1QT/+6tsMFMXsHDkobpuGNC+CULgTKY36/8PCuUhHz+e0E
         JrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772123462; x=1772728262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54084A4OEdYJ/FduLbr67Sj+jCec7nOyoBihp7G/XDQ=;
        b=ONRiubsHaqiWm8uD0ts/1GyOzNRgtc33gWIsvMhgeaYBmKD6AWDY5lL7T1GU0XMsGI
         PFpr4r7mKkInTMr1Y40rM3jr52EVs/0GkyqCFQ0pbJGpS9WBcDEIfRzCVD78oTKopPct
         AtQxG6NO/B0EfJj7MaidkF/SzbRzcueSodDQDFMvzFIosCZMqpw/Dt9NT8i9tEO1pPOU
         Qlwgm22KhPF4RKA3cvc/DwF1kuq0R0+R32TiyODaVNqdVbbafeZ8nZXLKnWStsuXE+qP
         SdJKknG3BLEO//tDjfsQsyH3D9fr+S1peaGfqMbPlKy2V1FDH/4feNbpPAnymGQaqKXs
         J/yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyGNfNnTQLZCoYzwCRRASZNAcMY1wa9fZdAbJ5egHYzttkuwD460p6D+uHZG9NfaPVGQdf2k2bkrlKog==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMuXCEjfTYq78h0EN8X4p0Je+dG0xFVnjUhVxQK3ZTHF/MomTu
	izlKXGEFWd7SFosGYogc/SwJrJ66/lfeakC/zhFsgm09Ify9PkSUX5Uwoc/GfwcPj9M=
X-Gm-Gg: ATEYQzxt4378hWiJCv2+nVfGPlQzEkAx7hHklaKcVHvllVsdWiYoJrM4dp6OObKDuLJ
	Q4bOpDKuQ2JzQNp7DBQpb5wY0iZXY8SljW4p1PiW8nc5jRyovvy2YW+EOb4xHtLNZgkQSjJESuy
	vq+84lL7VVMrFP6XAbXYGCxIG8I62toJYQEvoPdmMhmFupAeVz05OdU3X8lSoW4KVaMP+R6KaKh
	L+AW3CAUfrFrPf5MDtfl43IJ4V27mQV0fgs3zf7hHVuWMEvt5YIDBJpv5yoBNxt8uk95tjWBMer
	X/BrnvCW2ruJVaW0cVtO1R0xoiFyy68F6NA+g5DADCHvr9bpKZYSc4oPNH6DAMs0s3QLYsARaux
	dHJSOSLk4ZIbGvvEb7flcetqBtXgRKTvkpophR1wAn3RDFRs6RKRp4zQjcQhqZ/ez4msbH/35t3
	1fxHm0QmiDHRCPekft/FVPFxmWgYA3XWJYG3oQZsw+suwZdB7fgFKXgLLNlA==
X-Received: by 2002:a05:6000:1101:b0:439:8bee:b984 with SMTP id ffacd0b85a97d-4398beebf07mr6934299f8f.4.1772123462245;
        Thu, 26 Feb 2026 08:31:02 -0800 (PST)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c76b20bsm596856f8f.35.2026.02.26.08.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 08:31:01 -0800 (PST)
Message-ID: <64604c7e-5db9-49b9-b576-bbc627c8ddd1@suse.com>
Date: Thu, 26 Feb 2026 17:31:01 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] kswapd0: page allocation failure (bisected to "slab:
 add sheaves to most caches")
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, harry.yoo@oracle.com
Cc: chris.bainbridge@gmail.com, vbabka@suse.cz, surenb@google.com,
 dsterba@suse.cz, hao.li@linux.dev, leitao@debian.org,
 Liam.Howlett@oracle.com, zhao1.liu@intel.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-btrfs@vger.kernel.org, regressions@lists.linux.dev
References: <aZ5aAlDDpUoZxx_g@hyeyoo>
 <20260226162052.36121-1-mikhail.v.gavrilov@gmail.com>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <20260226162052.36121-1-mikhail.v.gavrilov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/26/26 17:20, Mikhail Gavrilov wrote:
> On Wed, Feb 25, 2026, Harry Yoo <harry.yoo@oracle.com> wrote:
>> Slab fix is submitted here, please feel free to test:
>>
>> https://lore.kernel.org/linux-mm/20260223133322.16705-1-harry.yoo@oracle.com
> 
> No page allocation failures after 33 hours of uptime under normal
> desktop workload with memory pressure (64GB RAM, btrfs + zram swap,
> Chrome with many tabs, AMD GPU).
> 
> Previously without this patch, I was seeing failures from both
> kswapd0/btrfs and chrome/amdgpu callers within 10 hours.
> 
>   Kernel: 7.0.0-rc1 (commit 7dff99b35460 + this patch)
>   Hardware: ASUS ROG STRIX B650E-I, AMD Ryzen, 64GB RAM
> 
> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

Thanks, added to the commit.
