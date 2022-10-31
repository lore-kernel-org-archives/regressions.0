Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4655E443D
	for <regressions@lists.linux.dev>; Mon, 31 Oct 2022 20:53:19 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A6C8F240104
	for <regressions@lists.linux.dev>; Mon, 31 Oct 2022 21:47:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.eu; s=2017;
	t=1667249222; bh=14ImJoriqviYQaubYTW2HWYoZcV6WuztfnCI0NZQ2Bc=;
	h=Date:From:Subject:To:Cc:From;
	b=gej8Gn2LSjg738qmxy8uVtlwf9JsIbOnvnfrCwfjY+h5gegHfJyfxWrd15e7Jkk1f
	 QBbOwJW1v4MvyEVdu6T31zOI9Phhexk5056aP0lDnsQtHzxzmtVxzaHkxuSsAzQi7X
	 fH9y6aSM0B7ilKPyXA/Vm9gVXgkbhMa8UrX1CDAlNMPYmXdDs0jBLqXVJQ//Ai8nTY
	 APMTRjk7szb7F8SNb1UZHZSHp5+uK+WPm87U8yN5H/6w7DFXmmY3+ejuAYV7puizJ/
	 8ohSH/N1Q4p0V6iHe4cIjk5KW9TdNPLrJSbMqzHbVNoMBY2CpCaZxX93HS9KbnRy7F
	 4MBVgvUgFAujg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4N1QF20DLqz9rxB;
	Mon, 31 Oct 2022 21:47:02 +0100 (CET)
Message-ID: <71829e56-a13f-0462-37a7-a4d64c16f561@posteo.de>
Date: Mon, 31 Oct 2022 20:47:01 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: postix@posteo.eu
Subject: Fwd: [REGRESSION 6.0.x / 6.1.x] NULL dereferencing at tracing
Reply-To: 20221031144850.5522b036@rorschach.local.home
To: rostedt@goodmis.org
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, tiwai@suse.de
References: <e693eb6b-28d0-d091-3df3-60f2b591c0e7@posteo.de>
Content-Language: en-US, de-DE
In-Reply-To: <e693eb6b-28d0-d091-3df3-60f2b591c0e7@posteo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Can you apply this to see if it fixes it?
>
> I'm guessing there's a path to the release of the file descriptor where
> the ring buffer isn't allocated (and this expected it to be).
>
> I'll investigate further to see if I can find that path.
>
> -- Steve
>
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c 
> index 199759c73519..c1c7ce4c6ddb 100644 --- 
> a/kernel/trace/ring_buffer.c +++ b/kernel/trace/ring_buffer.c @@ 
> -937,6 +937,9 @@ void ring_buffer_wake_waiters(struct trace_buffer 
> *buffer, int cpu)   	struct ring_buffer_per_cpu *cpu_buffer;
>   	struct rb_irq_work *rbwork;
>   
> + if (!buffer) + return; +   	if (cpu == RING_BUFFER_ALL_CPUS) {
>   
>   		/* Wake up individual ones too. One level recursion */

Dear Steve,


I have tested your suggested patch using kernel 6.1.0-rc2, but 
unfortunately it didn't fix the issue for me.

Thank you for looking into it though!


Best Regards

--AD




