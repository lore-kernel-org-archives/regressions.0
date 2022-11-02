Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CCA6D18
	for <regressions@lists.linux.dev>; Wed,  2 Nov 2022 16:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197AAC433D6;
	Wed,  2 Nov 2022 16:03:40 +0000 (UTC)
Date: Wed, 2 Nov 2022 12:03:38 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: postix@posteo.eu
Cc: 20221031144850.5522b036@rorschach.local.home,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev, tiwai@suse.de
Subject: Re: [REGRESSION 6.0.x / 6.1.x] NULL dereferencing at tracing
Message-ID: <20221102120338.254741f7@rorschach.local.home>
In-Reply-To: <25d7e982-f959-d86c-a6e7-5efd1db1e75c@posteo.de>
References: <e693eb6b-28d0-d091-3df3-60f2b591c0e7@posteo.de>
	<71829e56-a13f-0462-37a7-a4d64c16f561@posteo.de>
	<25d7e982-f959-d86c-a6e7-5efd1db1e75c@posteo.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  2 Nov 2022 15:57:56 +0000
postix@posteo.eu wrote:

> Hello everyone,
> 
> I have added lot's of debug printk's to see what's happening and I found 
> that the "cpu" counter, which is used to access the buffer's array 
> elements (cpu_buffer = buffer->buffers[cpu]) in the ring_buffer_wake_waiters
> function, exceeds the maximum number of total of total cores, namely in 
> my case 24, which means, it should only run from 0..23. However, upon 
> debugging, it runs up to 31, and thus causing a NULL pointer dereference 
> (&cpu_buffer->irq_work).
> 

Could you add this patch.

 https://lore.kernel.org/all/20221101191009.1e7378c8@rorschach.local.home/

Thanks,

-- Steve

