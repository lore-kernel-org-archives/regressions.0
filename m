Received: from manul.sfritsch.de (manul.sfritsch.de [138.201.64.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541DB2CB2
	for <regressions@lists.linux.dev>; Wed,  8 Dec 2021 17:43:49 +0000 (UTC)
Message-ID: <011690dd-ad46-c66b-7a8e-26ad3520f14d@sfritsch.de>
Date: Wed, 8 Dec 2021 18:43:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Nouveau] Regression in 5.15 in nouveau
Content-Language: de-DE
To: Dan Moulding <dmoulding@me.com>
Cc: bskeggs@redhat.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 regressions@leemhuis.info, regressions@lists.linux.dev
References: <3bf72f52-0101-36e1-8c95-4bd983dd4f04@sfritsch.de>
 <20211207204528.6740-1-dmoulding@me.com>
From: Stefan Fritsch <sf@sfritsch.de>
In-Reply-To: <20211207204528.6740-1-dmoulding@me.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.12.21 21:45, Dan Moulding wrote:
>> There is a pretty obvious typo in there:
>>
>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> @@ -359,7 +359,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct
>> nouveau_channel *chan, bool e
>>                   fobj = dma_resv_shared_list(resv);
>>           }
>>
>> -       for (i = 0; (i < fobj ? fobj->shared_count : 0) && !ret; ++i) {
>> +       for (i = 0; i < (fobj ? fobj->shared_count : 0) && !ret; ++i) {
>>                   struct nouveau_channel *prev = NULL;
>>                   bool must_wait = true;
>>
>>
>> With that it works and I don't see the flickering in a short test. I
>> will do more testing, but maybe Dan can test, too.
>>
>> Cheers,
>> Stefan
> 
> After fixing the typo the patch is working for me, also. dmesg is also
> clean. I will continue running the patched kernel. If I see any
> issues, I will report back here.

OK, looks good: I have tested it on top of v5.15.5 for a day and no 
black flickering and no other problems. I am not qualified to review the 
patch, though.

Thanks for the quick responses to everyone.

Cheers,
Stefan
