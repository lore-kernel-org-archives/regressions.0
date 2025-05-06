Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBF0306CDD
	for <regressions@lists.linux.dev>; Tue,  6 May 2025 03:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746502423; cv=none; b=XkD5R0hsFahsoHCOjM9qltOJujbYgm5gWl2dFbG+f6xk9PfunfXnmWYP1D30GvSXBxJu2DlPJ8Gan0CtoRWs45DEr1/BuSvdCltLDdqgs7+Ry6MO+ck6ADcW6TVtR6e1cBzO6XTTbULQ3AuFY2sPr8J4gFvaHZOi4FoTUSEDa38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746502423; c=relaxed/simple;
	bh=2goMvQ3qzdH9wOsvkRpyFXo/JeNlio7mx4eH3846IVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clhmbVpLWQzLMVmjVsV9GCD/vcyPUjqFB+LTt6r1hQmLJul5R2rH4O8dR64kiB/bCt3i0+Y6NYkXN4D0ED9ey62mBplQNMMpfTiKOIfVtq41svFru37vSy/IbRJrcFTnMDvASKEoWgSyEQw5SwVU9HFpP634MrLlf63NTBhruOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=qWkaYd7K; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="qWkaYd7K"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746502418; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=CUpvAXTG+sIqPcJVqAAskuK9yt70CbxZPTiboeMWKZE=;
	b=qWkaYd7KleuKJDadIso0ZDk627MqjEmvA4RpRfZDGY3+1oKCDR8zYtlelunX+SYYHKgHq6FapD0a8H0h6Omdt7bzfUF1z9rrh8O+4dF9Ck5IgHN2U9s/7gV2BvL3fubAgmX9HPAM139PzdFM6zeyPPm/5ypH4dxGVbwKyHwHhrI=
Received: from 30.74.144.110(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WZJQtMn_1746502415 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 06 May 2025 11:33:35 +0800
Message-ID: <e54e0b31-1b92-4110-b8ac-4737893fe197@linux.alibaba.com>
Date: Tue, 6 May 2025 11:33:34 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [PATCH v3 3/6] mm: shmem: add large folio
 support for tmpfs
To: David Hildenbrand <david@redhat.com>, Daniel Gomez <da.gomez@kernel.org>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 akpm@linux-foundation.org, hughd@google.com, willy@infradead.org,
 wangkefeng.wang@huawei.com, 21cnbao@gmail.com, ryan.roberts@arm.com,
 ioworker0@gmail.com, da.gomez@samsung.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Eero Tamminen <eero.t.tamminen@intel.com>
References: <cover.1732779148.git.baolin.wang@linux.alibaba.com>
 <035bf55fbdebeff65f5cb2cdb9907b7d632c3228.1732779148.git.baolin.wang@linux.alibaba.com>
 <aBEP-6iFhIC87zmb@intel.com>
 <ac8cbd8d-44e9-4a88-b88b-e29e9f30a2fd@linux.alibaba.com>
 <aBIHYqzar5J8uxGO@intel.com>
 <cxwpgygobg6wleoeezbowjhmid4mdhptzheqask44ew37h2q24@kryzkecuobbp>
 <57dc4929-268b-4f3f-a0f8-43d6ec85974f@linux.alibaba.com>
 <72978e3a-ee67-47d4-b06d-e911bc5d57ff@redhat.com>
 <exl3dpqh7oqhdd3afo3gvainumqw6j4ebfifkyeqkqvf36yxlh@pcuhdqanuy32>
 <a34c844d-b44f-411c-b5d7-8e38a50b0b05@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <a34c844d-b44f-411c-b5d7-8e38a50b0b05@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/5/2 23:31, David Hildenbrand wrote:
> On 02.05.25 15:10, Daniel Gomez wrote:
>> On Fri, May 02, 2025 at 09:18:41AM +0100, David Hildenbrand wrote:
>>> On 02.05.25 03:02, Baolin Wang wrote:
>>>>
>>>>
>>>> On 2025/4/30 21:24, Daniel Gomez wrote:
>>>>> On Wed, Apr 30, 2025 at 02:20:02PM +0100, Ville Syrjälä wrote:
>>>>>> On Wed, Apr 30, 2025 at 02:32:39PM +0800, Baolin Wang wrote:
>>>>>>> On 2025/4/30 01:44, Ville Syrjälä wrote:
>>>>>>>> On Thu, Nov 28, 2024 at 03:40:41PM +0800, Baolin Wang wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> This causes a huge regression in Intel iGPU texturing performance.
>>>>>>>
>>>>>>> Unfortunately, I don't have such platform to test it.
>>>>>>>
>>>>>>>>
>>>>>>>> I haven't had time to look at this in detail, but presumably the
>>>>>>>> problem is that we're no longer getting huge pages from our
>>>>>>>> private tmpfs mount (done in i915_gemfs_init()).
>>>>>>>
>>>>>>> IIUC, the i915 driver still limits the maximum write size to 
>>>>>>> PAGE_SIZE
>>>>>>> in the shmem_pwrite(),
>>>>>>
>>>>>> pwrite is just one random way to write to objects, and probably
>>>>>> not something that's even used by current Mesa.
>>>>>>
>>>>>>> which prevents tmpfs from allocating large
>>>>>>> folios. As mentioned in the comments below, tmpfs like other file
>>>>>>> systems that support large folios, will allow getting a highest 
>>>>>>> order
>>>>>>> hint based on the size of the write and fallocate paths, and then 
>>>>>>> will
>>>>>>> attempt each allowable huge order.
>>>>>>>
>>>>>>> Therefore, I think the shmem_pwrite() function should be changed to
>>>>>>> remove the limitation that the write size cannot exceed PAGE_SIZE.
>>>>>
>>>>> To enable mTHP on tmpfs, the necessary knobs must first be enabled 
>>>>> in sysfs
>>>>> as they are not enabled by default IIRC (only THP, PMD level). 
>>>>> Ville, I
>>>>> see i915_gemfs the huge=within_size mount option is passed. Can you 
>>>>> confirm
>>>>> if /sys/kernel/mm/transparent_hugepage/hugepages-*/enabled are also 
>>>>> marked as
>>>>> 'always' when the regression is found?
>>>>
>>>> The tmpfs mount will not be controlled by
>>>> '/sys/kernel/mm/transparent_hugepage/hugepages-*Kb/enabled' (except for
>>>> the debugging options 'deny' and 'force').
>>>
>>> Right, IIRC as requested by Willy, it should behave like other FSes 
>>> where
>>> there is no control over the folio size to be used.
>>
>> Thanks for reminding me. I forgot we finally changed it.
>>
>> Could the performance drop be due to the driver no longer using 
>> PMD-level pages?
> 
> I suspect that the faulting logic will now go to a smaller order first, 
> indeed.
> 
> ... trying to digest shmem_allowable_huge_orders() and 
> shmem_huge_global_enabled(), having a hard time trying to isolate the 
> tmpfs case: especially, if we run here into the vma vs. !vma case.
> 
> Without a VMA, I think we should have "mpfs will allow getting a highest 
> order hint based on and fallocate paths, then will try each allowable 
> order".
> 
> With a VMA (no access hint), "we still use PMD-sized order to locate 
> huge pages due to lack of a write size hint."
> 
> So if we get a fallocate()/write() that is, say, 1 MiB, we'd now 
> allocate an 1 MiB folio instead of a 2 MiB one.

Right.

So I asked Ville how the shmem folios are allocated in the i915 driver, 
and to see if we can make some improvements.
