Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565132FAD
	for <regressions@lists.linux.dev>; Tue,  8 Jun 2021 02:15:38 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id q15so15300320pgg.12
        for <regressions@lists.linux.dev>; Mon, 07 Jun 2021 19:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lidoAK1TqTDAirTb0C4p77svAI9lqTR1tMyvy1dY2oM=;
        b=b6hQjQU+9cbqxEYPY4hfh7kJJBY4TBQ5hirdW1x2RFbya3VSdQfM2xFzcIcBSIcbdg
         pzbhUayys3J3UICIIrThCvpxdnimEylgbkFY6RBaFDCIs8NQphpzmP+jBWAac6MG2sKm
         m5sqqhVv0nS0evUe/ooJotXxv+2J3+0eL9bY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lidoAK1TqTDAirTb0C4p77svAI9lqTR1tMyvy1dY2oM=;
        b=MWomJgHWSrVFDDzZouMEp8bwb6ibjDuwoDXYpq24Z6GN7LcrPO7pyBobuJVuaLGHf1
         BvaWpChDLgLJwWNjzL/iJKsl2ZIQNsrQ6CiU01XfBz94rj+LkmkKT5vKXQM02ddkGuOo
         9VfeD6G75qFxa64qZbBP326xsoFsU012SGY6+cZAdbPnxhCDXBXftcuH3sztyxecFPGG
         HrZM0IR7+ng/dqTsb6SFKcTGkRw6HzHVdsgewH90ukfSqXnjMMqfvUMU+fy6WW0iEaiz
         9DLazz9nIIZnXVLcN8OtPt3Pv6NVLDfFueK5oWF8rZa5/y+xbKt4aZVB1o/51HCRvyj+
         NatA==
X-Gm-Message-State: AOAM533PKUpbW04KPjn7FRwqgZpb/EyKMWhyBxXUWeA13Jl8fgastzVs
	ZaAY2oRn2//bGx/WY3BjeRWloHsehWpWOQ==
X-Google-Smtp-Source: ABdhPJy2YJmJpW0o5DMofIcPdqIDqJ0+VtnTIUAiohH3fHfoQcegB87vRyKccGMescHRJRuVS3lnHQ==
X-Received: by 2002:a62:1701:0:b029:2e9:a8ed:fcce with SMTP id 1-20020a6217010000b02902e9a8edfccemr19787918pfx.19.1623118537744;
        Mon, 07 Jun 2021 19:15:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 20sm9392040pfi.170.2021.06.07.19.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 19:15:37 -0700 (PDT)
Date: Mon, 7 Jun 2021 19:15:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <christian.brauner@ubuntu.com>,
	regressions@lists.linux.dev,
	Andrea Righi <andrea.righi@canonical.com>
Subject: Re: Regression when writing to /proc/<pid>/attr/
Message-ID: <202106071856.5D68C05638@keescook>
References: <20210607142245.eikvyeacqwwu6dn3@wittgenstein>
 <202106071621.C11535A@keescook>
 <CAHk-=wg8Bqjf8vxythgN9EV-XTttf7GXeus14kDkVZuUwLibrw@mail.gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg8Bqjf8vxythgN9EV-XTttf7GXeus14kDkVZuUwLibrw@mail.gmail.com>

On Mon, Jun 07, 2021 at 05:02:28PM -0700, Linus Torvalds wrote:
> On Mon, Jun 7, 2021 at 4:38 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > I'm assuming the issue is the latter (open, drop privs, write). And
> > I assume fsuid/fsgid has changed? (i.e. cred_fscmp() couldn't be used
> > either?)
> 
> Hmm. Do we have some place to hide self_exec_id at open time, and then
> just verify that it's still the same at IO time?
> 
> IOW, replace that f_cred comparison with a "self_exec_id has not
> changed" comparison instead?

I think we can't use self_exec_id because the original flaw could just
be changed to have the parent open two children (the fd opener and the
victim), which would have the same self_exec_id.

> Perhaps squirrel it away in file->f_private? Or are we already using
> that (didn't check)?

But we can do tracking via file->private_data since the attr files don't
use a custom opener. I think an mm_struct comparison is likely what's
needed here? (This is actually what several of these special proc files
are already doing, but they actually _use_ mm_struct.)

UNTESTED:


diff --git a/fs/proc/base.c b/fs/proc/base.c
index 58bbf334265b..7118ebe38fa6 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -2674,6 +2674,11 @@ static int proc_pident_readdir(struct file *file, struct dir_context *ctx,
 }
 
 #ifdef CONFIG_SECURITY
+static int proc_pid_attr_open(struct inode *inode, struct file *file)
+{
+	return __mem_open(inode, file, PTRACE_MODE_READ_FSCREDS);
+}
+
 static ssize_t proc_pid_attr_read(struct file * file, char __user * buf,
 				  size_t count, loff_t *ppos)
 {
@@ -2704,7 +2709,7 @@ static ssize_t proc_pid_attr_write(struct file * file, const char __user * buf,
 	int rv;
 
 	/* A task may only write when it was the opener. */
-	if (file->f_cred != current_real_cred())
+	if (file->private_data != current->mm)
 		return -EPERM;
 
 	rcu_read_lock();
@@ -2754,9 +2759,11 @@ static ssize_t proc_pid_attr_write(struct file * file, const char __user * buf,
 }
 
 static const struct file_operations proc_pid_attr_operations = {
+	.open		= proc_pid_attr_open,
 	.read		= proc_pid_attr_read,
 	.write		= proc_pid_attr_write,
 	.llseek		= generic_file_llseek,
+	.release	= mem_release,
 };
 
 #define LSM_DIR_OPS(LSM) \

-- 
Kees Cook
