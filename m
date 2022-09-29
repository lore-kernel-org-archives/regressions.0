Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4771C13
	for <regressions@lists.linux.dev>; Thu, 29 Sep 2022 14:22:37 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1664460784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U6eCrG1bH2S5fazyYRexbB2EWVUobKqy0ORHgIDtUYs=;
	b=2g6I7PM7tVIp0xbIrsWRmMwSlnQSNBLRAtDvVxGvExqAsBrGpQzn7MU/FpE3DOEemN899Z
	zcDBfbuXSdNPC83MBHqfUkpVQ7fu3VMOgYKUadQ+vjYZ2OAz1xjAp9e9QC5OQkzRVFgo9O
	jJwFB7tNqtfRgXt5dUdcLaI4meMSFqoapyBbehk3304QKYdnnAEuA5TekI0Jz55QL3JSDc
	1h1IVon9JkkT9y4wlyEiJ8bR9SK4uDV4yLs0nML54GpqErdpGulhsQ3Rze0vsn+obQbFvA
	ItRD+EVC/YDU8vkW0kGiwasvUu2QNAKVUb2/ZB8XvZoVyAMM2+Gs9k7CfGz6Fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1664460784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U6eCrG1bH2S5fazyYRexbB2EWVUobKqy0ORHgIDtUYs=;
	b=jncNNLCbNfH8hPTqrL9DjDR3m8DpnXXaYuiHXNE0yLH7NCPMzcboRdAHe6567mUYhzlxud
	L94aX1AGNyN7fKDw==
To: Conor Dooley <conor.dooley@microchip.com>, Petr Mladek <pmladek@suse.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Conor Dooley
 <conor@kernel.org>, senozhatsky@chromium.org, rostedt@goodmis.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [resend][bug] low-probability console lockups since 5.19
In-Reply-To: <YzV40LbMHcW1S/9O@wendy>
References: <Yy3dsSgpDnovBdEn@spud> <YzR8fzyjhggO+/tT@spud>
 <98f62903-3d6f-30b4-82ef-3b0460824907@leemhuis.info>
 <YzVlYaUPcRmlfE7c@wendy> <YzVvl+rv3iZS9vxk@alley> <YzV40LbMHcW1S/9O@wendy>
Date: Thu, 29 Sep 2022 16:19:03 +0206
Message-ID: <877d1m46c0.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 2022-09-29, Conor Dooley <conor.dooley@microchip.com> wrote:
> I will, possibly tonight but probably not, run the bisection again
> with the threaded printer merge reverted. Hopefully it is not filled
> with conflicts if I go that way...

It might be easier for you to just apply the following patch to run your
tests . This simple patch disables kthread usage.

John Ogness


diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index b095fb5f5f61..9679887c0805 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3605,6 +3605,10 @@ static int __init printk_activate_kthreads(void)
 {
 	struct console *con;
 
+	/* hack: never activate kthreads */
+	if (!printk_kthreads_available)
+		return 0;
+
 	console_lock();
 	printk_kthreads_available = true;
 	for_each_console(con)
