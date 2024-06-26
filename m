Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F31B16190C
	for <regressions@lists.linux.dev>; Wed, 26 Jun 2024 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719408890; cv=none; b=HcmlBzmaaIF3DzwG5771LUPnl1jcHhkqx9S+Lv6lHhV52bXpejXpdzZSg/X1+0W0ckGMwcUQmH/Jz8f9lmzjBz5W0g3kzwRgLL7gXTwjW+PDEttMHSLZHjVI9Dupf/OCJYXeECJOBskYE0fLkblTwfYnB/K0LSFOMNrgpWz8I8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719408890; c=relaxed/simple;
	bh=0dhkLQByZQyQREJ/jDXsMAaxg0FH/9/7ubG2ajZen5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dk3x/e3nsa+Q89dEd7jGQ/mO5ETu9Xl2CClONiEZ+5PtaGaB4tbjDLIQRTA3P0jUHnUCzai31qlDUhcvuEZZ8ddTwDjLLdlWr5cSltGXDpgfVybnqPSXdFmdAfkqFVQLC6XDq8yz39Pqhmi2QtQ4hKkmvthj9X579I5nDQRNC4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=G3xUdRWe; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="G3xUdRWe"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e033d34987cso292981276.1
        for <regressions@lists.linux.dev>; Wed, 26 Jun 2024 06:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1719408887; x=1720013687; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2ukVWFT1tyYPa/ZAcJ6dOW3ry3HjmGJ9j874uwa7jY=;
        b=G3xUdRWeNnHji3O+dZGPbYEnwspFE8m7TFw87E81EgoJ6XoKR/2yUXtTcLwmFVQv4Y
         VWrM/J7Lf15jtTRdkd2WU0btRXnUYn1JfZYmtRKkAzr8nb529rMmr+vVTEIZ9By8FjWR
         aaC9UbA/AMrtUVGBsQLtNKO8EY8nhIsL5PlP+o0ITBcgjNdeu7hubcAzYiuz837iiZnK
         AQF0QZWz+/QbCG/cJVmGPay1UHHkN4ZdJKEoqNoWqgsg4oy7saJH52PgWuPwlArLcus8
         Hgdi3jFvnk6jl+0DFgkeWMUJLzdvyCntjIpqzeIVZQJbZ5NujhzcX2a4BqdRMIHdqwl2
         DXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719408887; x=1720013687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V2ukVWFT1tyYPa/ZAcJ6dOW3ry3HjmGJ9j874uwa7jY=;
        b=QmpE5WOeftt8DEejWT61ih41ZzrVJItciYyk3imaIHKhJncTyfyMPZwX+eMlPN6DcF
         lhVEUF9NVbiIOvpG+EJWPMZGVPGwLGYeVjg5xtJtJbfQ3UmO2MrzPNJ2JBYhRTpgPdQR
         SrxU7ocrvFyQ12YFG2ofvAYYFActk4FIUU4xOzpWFzL10XTACCM9d5HKr/Rm00Ow+Usm
         zDE0mVo9yzbFhze60RbtDPzMkM7Uxlqr0OBEOR9+gjO4O+XzANo7JfE6FUAHKeqaIxpV
         z7vjsZKH3NlQLL7IJGvU5lDhd8DXSo2vz6q9qpXd93eU/QHwxl+TbF0nhdrYj+eTqOTW
         thpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhFZni5EGBNR16Zqp7jXpKRxYzoHM31+b9KE5jMug2uOe2HwzQV9FpxFvRF/Ny8NcITE30NBFj1qUx+X6K+JNmWH6mV51xaR0bVGE=
X-Gm-Message-State: AOJu0YzZKqzma2nGWn8gxzFPP+zQ0p6ufZzgy35sfOSsCEMbSaDt6+uh
	IpHvNAMmGZJm9/lWRmBlaDL4ovvZW+Hbdd32oqG6foeOuDEzoaxtXtPSFUNE3+k=
X-Google-Smtp-Source: AGHT+IEQI8k8PaDkmUreltxCCIhuD3MDFLr14G/kuLv1N8q8FK1w7DZXRPufoe5tRX7CDtMnP4E8Cw==
X-Received: by 2002:a5b:f90:0:b0:dfe:fac8:b890 with SMTP id 3f1490d57ef6-e0300fcee40mr10585487276.28.1719408887101;
        Wed, 26 Jun 2024 06:34:47 -0700 (PDT)
Received: from [192.168.0.50] (dhcp-24-53-241-2.cable.user.start.ca. [24.53.241.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444c2c3dc89sm66757551cf.65.2024.06.26.06.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:34:46 -0700 (PDT)
Message-ID: <cc70c1e7-aa1b-45a7-8edf-20dc4f3b75ad@draconx.ca>
Date: Wed, 26 Jun 2024 09:34:44 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Hailong Liu <hailong.liu@oppo.com>
References: <ZnqspTVl/76jM9WD@MiWiFi-R3L-srv> <Znq6tEtCgB6QnnJH@pc638.lan>
 <Znq/8/HAc/0p6Ja0@MiWiFi-R3L-srv> <ZnrjZRq5-_hemrbD@pc636>
 <ZnrnADHvOiNcZv9t@MiWiFi-R3L-srv> <Znr1IQ1mssdNNXbv@pc638.lan>
 <ZnsjIB2byIxSgbjc@pc636> <20240626051206.mx2r4iy3wpexykay@oppo.com>
 <ZnvcToH1h-sVtikh@pc636> <20240626100342.2dudj6fjjx6srban@oppo.com>
 <Znvyvof4CnFETJ-v@pc636>
Content-Language: en-US
From: Nick Bowler <nbowler@draconx.ca>
In-Reply-To: <Znvyvof4CnFETJ-v@pc636>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-06-26 06:51, Uladzislau Rezki wrote:
[...]
> Thank you for pointing this. Below is updated version with extra comment:

I checked that I can still reproduce the problem on 6.10-rc5 and with
this patch applied on top, xfsdump doesn't crash anymore.

> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 45e1506d58c3..03b82fb8ecd3 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2542,7 +2542,15 @@ static DEFINE_PER_CPU(struct vmap_block_queue, vmap_block_queue);
>  static struct xarray *
>  addr_to_vb_xa(unsigned long addr)
>  {
> -	int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> +	int index = (addr / VMAP_BLOCK_SIZE) % nr_cpu_ids;
> +
> +	/*
> +	 * Please note, nr_cpu_ids points on a highest set
> +	 * possible bit, i.e. we never invoke cpumask_next()
> +	 * if an index points on it which is nr_cpu_ids - 1.
> +	 */
> +	if (!cpu_possible(index))
> +		index = cpumask_next(index, cpu_possible_mask);
>  
>  	return &per_cpu(vmap_block_queue, index).vmap_blocks;
>  }

Thanks,
  Nick
