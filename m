Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C98470
	for <regressions@lists.linux.dev>; Tue,  8 Jun 2021 07:02:39 +0000 (UTC)
Received: from mail-ej1-f70.google.com ([209.85.218.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <andrea.righi@canonical.com>)
	id 1lqVTH-0000fq-GI
	for regressions@lists.linux.dev; Tue, 08 Jun 2021 06:44:19 +0000
Received: by mail-ej1-f70.google.com with SMTP id mp38-20020a1709071b26b02903df8ccd76fbso6335715ejc.23
        for <regressions@lists.linux.dev>; Mon, 07 Jun 2021 23:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6b+ZymcgI/lfd72oUl867s93DDx2Fr9GIpOWzzwEaLQ=;
        b=YJL/26084lezUkBXBL2gvCXACa18i7nNsXudzLS6r6VP54v10jeAnWhQiZgC33pO6Z
         n+q1zuZp7zcSNlwc31z4ke/73qaj0Q9OovoyTtXFRfGMgvtez5oeW6MH/snYjtXCAItS
         KZ1HhqI1nxLUrUmqumVYY2RLh5ebK+byxNzP2KGZMCuxRbg5spLWFiucTf7UmYexAk3H
         aWZFvUGq9ximoT0t46h4yxLqmuAYHdni9W7gpXJwRZb2OPn9uPKNpMo+0fmOCvk0QrCA
         yOGUkNpk+jOOeGP0QYUBkZRMCVd0z2M5S/IpNbTEWl9Xr69oYOUoTHN20PX7Z7n8HxSs
         UCzQ==
X-Gm-Message-State: AOAM530Aoj8FZ3sWfYUacU0uIiVTUhUMyCu2gI5S6EXLkRaqnZgTrhFk
	w55ap4IVxJOM36GDNbGEXmSK3p0PwTXDKG85cS3OoYZlXZHFbSftdPsiNgWACfociAsMKJAk5QK
	+72lKkDiTnF5tVPkNfvEpnba9JPmghlGAZSnZu3XW
X-Received: by 2002:a17:907:948c:: with SMTP id dm12mr22041525ejc.484.1623134659141;
        Mon, 07 Jun 2021 23:44:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbMXOPCtr0+/I/YPzxKv1Z6WRuqwmTTlPlVinjy4lWwUj+nXp7DE6QypMtC3iiE2kxhxM6Kg==
X-Received: by 2002:a17:907:948c:: with SMTP id dm12mr22041505ejc.484.1623134658864;
        Mon, 07 Jun 2021 23:44:18 -0700 (PDT)
Received: from localhost (host-79-46-128-215.retail.telecomitalia.it. [79.46.128.215])
        by smtp.gmail.com with ESMTPSA id gw7sm7289046ejb.5.2021.06.07.23.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 23:44:18 -0700 (PDT)
Date: Tue, 8 Jun 2021 08:44:17 +0200
From: Andrea Righi <andrea.righi@canonical.com>
To: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	regressions@lists.linux.dev
Subject: Re: Regression when writing to /proc/<pid>/attr/
Message-ID: <YL8Rwb1Pnbdwk0xc@xps-13-7390>
References: <20210607142245.eikvyeacqwwu6dn3@wittgenstein>
 <202106071621.C11535A@keescook>
 <CAHk-=wg8Bqjf8vxythgN9EV-XTttf7GXeus14kDkVZuUwLibrw@mail.gmail.com>
 <202106071856.5D68C05638@keescook>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106071856.5D68C05638@keescook>

On Mon, Jun 07, 2021 at 07:15:36PM -0700, Kees Cook wrote:
> On Mon, Jun 07, 2021 at 05:02:28PM -0700, Linus Torvalds wrote:
> > On Mon, Jun 7, 2021 at 4:38 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > I'm assuming the issue is the latter (open, drop privs, write). And
> > > I assume fsuid/fsgid has changed? (i.e. cred_fscmp() couldn't be used
> > > either?)
> > 
> > Hmm. Do we have some place to hide self_exec_id at open time, and then
> > just verify that it's still the same at IO time?
> > 
> > IOW, replace that f_cred comparison with a "self_exec_id has not
> > changed" comparison instead?
> 
> I think we can't use self_exec_id because the original flaw could just
> be changed to have the parent open two children (the fd opener and the
> victim), which would have the same self_exec_id.
> 
> > Perhaps squirrel it away in file->f_private? Or are we already using
> > that (didn't check)?
> 
> But we can do tracking via file->private_data since the attr files don't
> use a custom opener. I think an mm_struct comparison is likely what's
> needed here? (This is actually what several of these special proc files
> are already doing, but they actually _use_ mm_struct.)
> 
> UNTESTED:

Thanks Kees! Comparing mm_struct makes sense to me. With this applied
the regression that I was experiencing with containers doesn't happen
anymore.

I'll run more stress tests with this, but for now it looks good to me,
so FWIW:

Tested-by: Andrea Righi <andrea.righi@canonical.com>

> 
> 
> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index 58bbf334265b..7118ebe38fa6 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -2674,6 +2674,11 @@ static int proc_pident_readdir(struct file *file, struct dir_context *ctx,
>  }
>  
>  #ifdef CONFIG_SECURITY
> +static int proc_pid_attr_open(struct inode *inode, struct file *file)
> +{
> +	return __mem_open(inode, file, PTRACE_MODE_READ_FSCREDS);
> +}
> +
>  static ssize_t proc_pid_attr_read(struct file * file, char __user * buf,
>  				  size_t count, loff_t *ppos)
>  {
> @@ -2704,7 +2709,7 @@ static ssize_t proc_pid_attr_write(struct file * file, const char __user * buf,
>  	int rv;
>  
>  	/* A task may only write when it was the opener. */
> -	if (file->f_cred != current_real_cred())
> +	if (file->private_data != current->mm)
>  		return -EPERM;
>  
>  	rcu_read_lock();
> @@ -2754,9 +2759,11 @@ static ssize_t proc_pid_attr_write(struct file * file, const char __user * buf,
>  }
>  
>  static const struct file_operations proc_pid_attr_operations = {
> +	.open		= proc_pid_attr_open,
>  	.read		= proc_pid_attr_read,
>  	.write		= proc_pid_attr_write,
>  	.llseek		= generic_file_llseek,
> +	.release	= mem_release,
>  };
>  
>  #define LSM_DIR_OPS(LSM) \
> 
> -- 
> Kees Cook
