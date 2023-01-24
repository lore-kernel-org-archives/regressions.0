Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056068F4B
	for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 20:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674591886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5BeQBrphgizYTu2EmfQ4dpSbHgXLQCkY9IO+ImuU17w=;
	b=OheHbVUAoFIXMkvTvmaVszId9RstFYXxgKo+50QDRT8/qXQ/GTcm43KPFGXoGJv6mnU81+
	/RtQW2gaPW5GskvIJ33aAnHKNm4SinXhs9dC0DBdFVjLueNmluoIUWD1QRqzz7lHIFeCID
	WiUg7d2ZtY/t+tMuJKDJpK9n5T8RafQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-SwbYbzDeP2qd_FkYaRbBhA-1; Tue, 24 Jan 2023 15:24:38 -0500
X-MC-Unique: SwbYbzDeP2qd_FkYaRbBhA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E92AC1C04345;
	Tue, 24 Jan 2023 20:24:37 +0000 (UTC)
Received: from [10.22.10.191] (unknown [10.22.10.191])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E98DD2026D2A;
	Tue, 24 Jan 2023 20:24:36 +0000 (UTC)
Message-ID: <fdf76fb2-1da4-2d72-7eb3-21137a7d6845@redhat.com>
Date: Tue, 24 Jan 2023 15:24:36 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] sched: Store restrict_cpus_allowed_ptr() call state
Content-Language: en-US
To: Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira
 <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>,
 Phil Auld <pauld@redhat.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, regressions@leemhuis.info
References: <20230121021749.55313-1-longman@redhat.com>
 <20230124194805.GA27257@willie-the-truck>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20230124194805.GA27257@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4


On 1/24/23 14:48, Will Deacon wrote:
> Hi Waiman,
>
> [+Thorsten given where we are in the release cycle]
>
> On Fri, Jan 20, 2023 at 09:17:49PM -0500, Waiman Long wrote:
>> The user_cpus_ptr field was originally added by commit b90ca8badbd1
>> ("sched: Introduce task_struct::user_cpus_ptr to track requested
>> affinity"). It was used only by arm64 arch due to possible asymmetric
>> CPU setup.
>>
>> Since commit 8f9ea86fdf99 ("sched: Always preserve the user requested
>> cpumask"), task_struct::user_cpus_ptr is repurposed to store user
>> requested cpu affinity specified in the sched_setaffinity().
>>
>> This results in a performance regression in an arm64 system when booted
>> with "allow_mismatched_32bit_el0" on the command-line. The arch code will
>> (amongst other things) calls force_compatible_cpus_allowed_ptr() and
>> relax_compatible_cpus_allowed_ptr() when exec()'ing a 32-bit or a 64-bit
>> task respectively. Now a call to relax_compatible_cpus_allowed_ptr()
>> will always result in a __sched_setaffinity() call whether there is a
>> previous force_compatible_cpus_allowed_ptr() call or not.
> I'd argue it's more than just a performance regression -- the affinity
> masks are set incorrectly, which is a user visible thing
> (i.e. sched_getaffinity() gives unexpected values).

Can your elaborate a bit more on what you mean by getting unexpected 
sched_getaffinity() results? You mean the result is wrong after a 
relax_compatible_cpus_allowed_ptr(). Right?

sched_getaffinity() just return whatever is in cpus_mask. Normally, it 
should be whatever cpus are allowed by the current cpuset unless 
sched_setaffinity() has been called before. So after a call to 
relax_compatible_cpus_allowed_ptr(), it should revert back to the 
cpu_allowed set in the cpuset. If sched_setaffinity() has been called, 
it should revert back to the intersection of the current cpuset and 
user_cpus_ptr.

Cheers,
Longman

