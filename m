Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B2021D75
	for <regressions@lists.linux.dev>; Tue,  1 Nov 2022 22:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5D9C433C1;
	Tue,  1 Nov 2022 22:43:48 +0000 (UTC)
Date: Tue, 1 Nov 2022 18:43:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Roland Ruckerbauer <roland.rucky@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>, regressions@lists.linux.dev, Steven Noonan
 <steven.noonan@gmail.com>
Subject: Re: [BUG] NULL pointer dereference probably caused by
 kernel/trace/ring_buffer.c
Message-ID: <20221101184347.2ecce20c@rorschach.local.home>
In-Reply-To: <20221101183512.285cfd68@rorschach.local.home>
References: <CAM6Wdxc0KRJMXVAA0Y=u6Jh2V=uWB-_Fn6M4xRuNppfXzL1mUg@mail.gmail.com>
	<20221031145046.2a7f9d32@rorschach.local.home>
	<CAM6WdxeZbGmRopXqLtDNTwPOahnyC6GrCfv4H1m=mF41-J=VbA@mail.gmail.com>
	<20221101153135.5345c748@rorschach.local.home>
	<CAM6WdxfYU1Dc6dkMQMSGjgiggrziLvfwVPJV5OC02_AQO8YkVw@mail.gmail.com>
	<20221101173802.7a476a04@rorschach.local.home>
	<CAM6WdxdAF5X8v_tbL1LvNDXgEPY5veL_OtQv5CrADV9qH4um-g@mail.gmail.com>
	<CAM6WdxfsP13aS62=xWNTFEEzAekAuDwFTpnONP9qF3br-65KWQ@mail.gmail.com>
	<20221101183512.285cfd68@rorschach.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Nov 2022 18:35:12 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> OK, this is a great clue. I'll dig deeper.

One more NULL check. And this one is legit, and I'm betting is the fix.

The buffer->buffers is allocated to nr_cpu_ids, but are only
initialized for online CPUs. If you have a CPU that is not yet
initialized (or may never be), then the cpu_buffer will be NULL.

-- Steve

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 199759c73519..4ffcc6e33258 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -937,6 +937,9 @@ void ring_buffer_wake_waiters(struct trace_buffer *buffer, int cpu)
 	struct ring_buffer_per_cpu *cpu_buffer;
 	struct rb_irq_work *rbwork;
 
+	if (!buffer)
+		return;
+
 	if (cpu == RING_BUFFER_ALL_CPUS) {
 
 		/* Wake up individual ones too. One level recursion */
@@ -945,7 +948,14 @@ void ring_buffer_wake_waiters(struct trace_buffer *buffer, int cpu)
 
 		rbwork = &buffer->irq_work;
 	} else {
+		if (WARN_ON_ONCE(!buffer->buffers))
+			return;
+		if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
+			return;
 		cpu_buffer = buffer->buffers[cpu];
+		/* The CPU buffer may not have been initialized yet */
+		if (!cpu_buffer)
+			return;
 		rbwork = &cpu_buffer->irq_work;
 	}
 
