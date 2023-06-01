Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA2E23404
	for <regressions@lists.linux.dev>; Thu,  1 Jun 2023 11:29:30 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q4gUa-0001Kx-7O; Thu, 01 Jun 2023 13:29:20 +0200
Message-ID: <ea040d59-8760-32d3-ce5b-4120ed0efaa5@leemhuis.info>
Date: Thu, 1 Jun 2023 13:29:19 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, de-DE
To: Christian Brauner <brauner@kernel.org>,
 Mike Christie <michael.christie@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: oleg@redhat.com, nicolas.dichtel@6wind.com, axboe@kernel.dk,
 ebiederm@xmission.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, mst@redhat.com,
 sgarzare@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 hch@infradead.org, konrad.wilk@oracle.com
References: <20230519-vormittag-dschungel-83607e9d2255@brauner>
 <ab8c9f95-c9e9-de04-4e28-78163a32da80@leemhuis.info>
 <20230601-herzallerliebst-dschungel-4515db351a0c@brauner>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [RFC PATCH 0/8] vhost_tasks: Use CLONE_THREAD/SIGHAND
In-Reply-To: <20230601-herzallerliebst-dschungel-4515db351a0c@brauner>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1685618971;1a96e82f;
X-HE-SMSGID: 1q4gUa-0001Kx-7O

On 01.06.23 12:47, Christian Brauner wrote:
> On Thu, Jun 01, 2023 at 09:58:38AM +0200, Thorsten Leemhuis wrote:
>> On 19.05.23 14:15, Christian Brauner wrote:
>>> On Thu, May 18, 2023 at 10:25:11AM +0200, Christian Brauner wrote:
>>>> On Wed, May 17, 2023 at 07:09:12PM -0500, Mike Christie wrote:
>>>>> This patch allows the vhost and vhost_task code to use CLONE_THREAD,
>>>>> CLONE_SIGHAND and CLONE_FILES. It's a RFC because I didn't do all the
>>>>> normal testing, haven't coverted vsock and vdpa, and I know you guys
>>>>> will not like the first patch. However, I think it better shows what
>>>>
>>>> Just to summarize the core idea behind my proposal is that no signal
>>>> handling changes are needed unless there's a bug in the current way
>>>> io_uring workers already work. All that should be needed is
>>>> s/PF_IO_WORKER/PF_USER_WORKER/ in signal.c.
>> [...]
>>>> So it feels like this should be achievable by adding a callback to
>>>> struct vhost_worker that get's called when vhost_worker() gets SIGKILL
>>>> and that all the users of vhost workers are forced to implement.
>>>>
>>>> Yes, it is more work but I think that's the right thing to do and not to
>>>> complicate our signal handling.
>>>>
>>>> Worst case if this can't be done fast enough we'll have to revert the
>>>> vhost parts. I think the user worker parts are mostly sane and are
>>>
>>> As mentioned, if we can't settle this cleanly before -rc4 we should
>>> revert the vhost parts unless Linus wants to have it earlier.
>>
>> Meanwhile -rc5 is just a few days away and there are still a lot of
>> discussions in the patch-set proposed to address the issues[1]. Which is
>> kinda great (albeit also why I haven't given it a spin yet), but on the
>> other hand makes we wonder:
> 
> You might've missed it in the thread but it seems everyone is currently
> operating under the assumption that the preferred way is to fix this is
> rather than revert. 

I saw that, but that was also a week ago already, so I slowly started to
wonder if plans might have/should be changed. Anyway: if that's still
the plan forward it's totally fine for me if it's fine for Linus. :-D

BTW: I for now didn't sit down to test Mike's patches, as due to all the
discussions I assumed new ones would be coming sooner or later anyway.
If it's worth giving them a shot, please let me know.

> [...]

Thx for the update!

Ciao, Thorsten
