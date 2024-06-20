Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58811AE098
	for <regressions@lists.linux.dev>; Thu, 20 Jun 2024 18:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906576; cv=none; b=LTE7KeCqwyZFLGa+q2Gi4mor0Xg3UCMqVQnvkX21EmTShZNuJlFgTSC666d2Hk/L9o7VpVqBTOQ1ms94X/wyUccHecFx0tVBt8DO3hiS0k4MZLbzPjIul8EzXWVzypuk4/SWoBnGZDIYZSaUH7aVYudKcVWQ+z9S7e4bzBn7rHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906576; c=relaxed/simple;
	bh=Po3QlY7negO5UCla1ZS7JLYvAfUuS5/ro263AlASoqc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Mcb21Dj2iQ9cX8o3FRZR4krdi+KBRcdRre36w4MG+100VY6Wo4YHij00Y1kPNTTDijICx/gcas6ppxZbuh7qYtl4AKCQlYpoCiySb1PRSHukmh/SavD7cDG2Rq0Fg6hRc522o3gVhC+YX8muJk/XQMb5FLcRlnPzV+pXnHIVD38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=GPaifJIh; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="GPaifJIh"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-375858224adso3854465ab.0
        for <regressions@lists.linux.dev>; Thu, 20 Jun 2024 11:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1718906574; x=1719511374; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Qz9jlWmDkZmtbdUlVdk29k4QOcWOt4wWsvvxN5FWug=;
        b=GPaifJIhtkT5Q8T+NCf8y0bvWaRMQAXK3sv7GWryQ6hxeyM0b7T0Ybc21oTEvtvU9B
         kWGzPUbE89VJWxLK8oH/+ly32jkRqZd526IZTWym2R7xTFwD4PQtJcEhbU/YJDXfVmZS
         hCVMYSt/faPCNJg1CKTAa7l7gCkG7vbkcWt9oicdf2eAHZ3wr6UCc1/H2+d/JREX3GWB
         z/3Wb32HIfEMS4inqnM8+v9abb7nxEh/YTmldUXtZYK2n1YKuQzT7u6UqmmmsxAGPxmH
         KayfZMTKHP4Or6bPLuYi6ry3NBvRjeo4EYY+zBjHWt9oSAmUog9MhIaWt+SCAa134/CV
         tWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906574; x=1719511374;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Qz9jlWmDkZmtbdUlVdk29k4QOcWOt4wWsvvxN5FWug=;
        b=edczIuUjLZJ+watAXhdVDpar/HZr20k1m+kPSH+tzgJ9d02WLaXAGweZAlwujawG2Q
         VtQN33JWYggFDnQhGCTtzZsnqmyPoayRAopfCl1Y/vl4G49cjsuCklukj+JpjZJ8Qkvp
         pghBEAWB+WzPjxJIVCrKVvI8RZgwdbUEYKgZC/w0eJUkGpBRKYf1TpLmwp/89S15ln/d
         JaueMycM7U8igkdT8x03xumBz9aHw8eFVgoYD6zh+chHm3jdqsj46gcQARPJQVSM9SM7
         sKAtTPM2VjdpMmDBCZgEWOXzXYgfdxrq6CvWNr63HXKKw13cbC2lKtyrcFWH7rPlSyYO
         qseg==
X-Forwarded-Encrypted: i=1; AJvYcCXwX2HboX0syUosccPDHWf3o3VIsH0wtJMwC4fr9LXxU5N8vBJGMd6KRXeZyWJNJGlWusdxf/x/bX9Alb/j0ySeco6N+caEbaLOLxo=
X-Gm-Message-State: AOJu0YxSC/ittCMpJbSTA5RajgcjHrtkErEojUCinKtAN/ITxVv/wYXA
	IH27aGhDfMcKkGJExzwidzQgq7iYNMBJh8WdDpnch1DAQNHGbkVvgudL5gyBpMM=
X-Google-Smtp-Source: AGHT+IFfEEgDs4n2+MF/0tHKPsSrZUMKCSuyV8ocM4F5arwnroC2vy4H2Ws/7SUtA9bHKoG4bq/m/g==
X-Received: by 2002:a05:6e02:148c:b0:375:b19d:deb4 with SMTP id e9e14a558f8ab-3761d657299mr74849545ab.7.1718906573851;
        Thu, 20 Jun 2024 11:02:53 -0700 (PDT)
Received: from [192.168.0.50] (dhcp-24-53-241-2.cable.user.start.ca. [24.53.241.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b956934522sm4442432173.58.2024.06.20.11.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 11:02:53 -0700 (PDT)
Message-ID: <00d74f24-c49c-460e-871c-d5af64701306@draconx.ca>
Date: Thu, 20 Jun 2024 14:02:51 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
Content-Language: en-US
From: Nick Bowler <nbowler@draconx.ca>
To: linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <75e17b57-1178-4288-b792-4ae68b19915e@draconx.ca>
In-Reply-To: <75e17b57-1178-4288-b792-4ae68b19915e@draconx.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-06-20 02:19, Nick Bowler wrote:
> After upgrading my sparc to 6.9.5 I noticed that attempting to run
> xfsdump instantly (within a couple seconds) and reliably crashes the
> kernel.  The same problem is also observed on 6.10-rc4.
[...]
>   062eacf57ad91b5c272f89dc964fd6dd9715ea7d is the first bad commit
>   commit 062eacf57ad91b5c272f89dc964fd6dd9715ea7d
>   Author: Uladzislau Rezki (Sony) <urezki@gmail.com>
>   Date:   Thu Mar 30 21:06:38 2023 +0200
>   
>       mm: vmalloc: remove a global vmap_blocks xarray

I think I might see what is happening here.

On this machine, there are two CPUs numbered 0 and 2 (there is no CPU1).

The per-cpu variables in mm/vmalloc.c are initialized like this, in
vmalloc_init

  for_each_possible_cpu(i) {
    /* ... */
    vbq = &per_cpu(vmap_block_queue, i);
    /* initialize stuff in vbq */
  }

This loops over the set bits of cpu_possible_mask, bits 0 and 2 are set,
so it initializes stuff with i=0 and i=2, skipping i=1 (I added prints to
confirm this).

Then, in vm_map_ram, with the problematic change it calls the new
function addr_to_vb_xa, which does this:

  int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
  return &per_cpu(vmap_block_queue, index).vmap_blocks;

The num_possible_cpus() function counts the number of set bits in
cpu_possible_mask, so it returns 2.  Thus, index is either 0 or 1, which
does not correspond to what was initialized (0 or 2).  The crash occurs
when the computed index is 1 in this function.  In this case, the
returned value appears to be garbage (I added prints to confirm this).

If I change addr_to_vb_xa function to this:

  int index = ((addr / VMAP_BLOCK_SIZE) & 1) << 1; /* 0 or 2 */
  return &per_cpu(vmap_block_queue, index).vmap_blocks;

xfsdump is working again.

Cheers,
  Nick

