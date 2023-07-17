Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF71253BB
	for <regressions@lists.linux.dev>; Mon, 17 Jul 2023 15:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEA2C433C8;
	Mon, 17 Jul 2023 15:21:41 +0000 (UTC)
Date: Mon, 17 Jul 2023 11:21:38 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: <kkabe@vega.pgw.jp>
Cc: regressions@lists.linux.dev, bagasdotme@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: radeon.ko/i586: BUG: kernel NULL pointer
 dereference,address:00000004
Message-ID: <20230717112138.1fd48cca@gandalf.local.home>
In-Reply-To: <230715113911.M0124687@vega.pgw.jp>
References: <20230714100019.6bf9b1ab@gandalf.local.home>
	<230715113911.M0124687@vega.pgw.jp>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 15 Jul 2023 11:39:11 +0900
<kkabe@vega.pgw.jp> wrote:


> Yes, this is puzzling. That's why I need other people's opinion on this.
> Does it matter the DUT is a slow machine (Pentium 120MHz)?
> 

Hmm, I wonder because the workqueue is running __init functions, could it
possibly be that it didn't finish before the end of boot, where it frees
all the functions? It shouldn't do that because there's code to make sure
it's done before it continues further.

But just in case something isn't working as planned, you could try this
patch to see if the bug goes away.

-- Steve

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 05c0024815bf..af5a40ef3be4 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3771,13 +3771,13 @@ static int test_for_valid_rec(struct dyn_ftrace *rec)
 	return 1;
 }
 
-static struct workqueue_struct *ftrace_check_wq __initdata;
-static struct work_struct ftrace_check_work __initdata;
+static struct workqueue_struct *ftrace_check_wq;
+static struct work_struct ftrace_check_work;
 
 /*
  * Scan all the mcount/fentry entries to make sure they are valid.
  */
-static __init void ftrace_check_work_func(struct work_struct *work)
+static void ftrace_check_work_func(struct work_struct *work)
 {
 	struct ftrace_page *pg;
 	struct dyn_ftrace *rec;
