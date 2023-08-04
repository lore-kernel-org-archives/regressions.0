Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61986C14A
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 16:28:29 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qRxf6-0001Qz-Fw; Fri, 04 Aug 2023 18:28:24 +0200
Message-ID: <0eec59f5-2f9d-1058-6323-3177de82bd55@leemhuis.info>
Date: Fri, 4 Aug 2023 18:28:23 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: XFS metadata CRC errors on zram block device on ppc64le
 architecture
Content-Language: en-US, de-DE
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Dusty Mabe <dusty@dustymabe.com>
Cc: Hannes Reinecke <hare@suse.de>, wq@lst.de,
 Minchan Kim <minchan@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 marmijo@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <b2d40565-7868-ba15-4bb1-fca6f0df076b@dustymabe.com>
 <20230802094106.GA28187@lst.de>
 <3f36882c-b429-3ece-989b-a6899c001cbd@suse.de>
 <43843fec-f30a-1edc-b428-1d38ddb1050f@dustymabe.com>
 <a0f05188-d142-82f2-74aa-6c9a6ae2bbc9@dustymabe.com>
 <20230804032523.GA81493@google.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20230804032523.GA81493@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1691166509;381b7ea5;
X-HE-SMSGID: 1qRxf6-0001Qz-Fw

[CCing Linus and the regressions list; fwiw, initial report is here:
https://lore.kernel.org/all/b2d40565-7868-ba15-4bb1-fca6f0df076b@dustymabe.com/
]

On 04.08.23 05:25, Sergey Senozhatsky wrote:
> On (23/08/03 17:32), Dusty Mabe wrote:
>>>>>>      zram: simplify bvec iteration in __zram_make_request
>>>>>>      
>>>>>>      bio_for_each_segment synthetize bvecs that never cross page boundaries, so
>>>>>>      don't duplicate that work in an inner loop.
>>>>>
>>>>>> Any ideas on how to fix the problem?
>>>>>
>>>>> So the interesting cases are:
>>>>>
>>>>>    - ppc64 usually uses 64k page sizes
>>>>>    - ppc64 is somewhat cache incoherent (compared to say x86)
>>>>>
>>>>> Let me think of this a bit more.
>>>>
>>>> Would need to be confirmed first that 64k pages really are in use
>>>> (eg we compile ppc64le with 4k page sizes ...).
>>>> Dusty?
>>>> For which page size did you compile your kernel?
>>>
>>> For Fedora the configuration is to enable 64k pages with CONFIG_PPC_64K_PAGES=y
>>> https://src.fedoraproject.org/rpms/kernel/blob/064c1675a16b4d379b42ab6c3397632ca54ad897/f/kernel-ppc64le-fedora.config#_4791
>>>
>>> I used the same configuration when running the git bisect.
>>
>> Naive question from my side: would this be a candidate for reverting while we investigate the root cause?
> 
> That's certainly a possible solution.
> 
> But I don't quite understand why af8b04c63708 doesn't work.

Seems Christoph and Hannes (thx to both of you) got a bit closer to
that, but as this apparently is causing data corruption and we are close
to -rc5 I'd like to bring the following up now, as it gets harder to
discuss these things on weekends:

Should Linus revert the culprit for -rc5 if no fix is found within the
next 48 hours?

Ciao, Thorsten
