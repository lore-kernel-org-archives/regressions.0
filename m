Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA002F80
	for <regressions@lists.linux.dev>; Tue,  8 Jun 2021 17:03:42 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id h12so13342214pfe.2
        for <regressions@lists.linux.dev>; Tue, 08 Jun 2021 10:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aWMl0i+RwWtr8ALOLJ7ipJqD6WQzApvZ07e8tBAIQBg=;
        b=K91G1tm6RC7WgvU61IxhgMnuK7TJYva4joxPQI8tpp/f5zWf6pt3VHj+B6Ug/TZB93
         mJYtPoxNpWpT3lQuHybPanAFGFzyq7Y9qKxdlXN10cUnK8k7GmuKqaR6wMkmOJNXCW5a
         uUT31CeO2hhQmM83dNsHIVPelQAeHMNcVB3KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aWMl0i+RwWtr8ALOLJ7ipJqD6WQzApvZ07e8tBAIQBg=;
        b=dyMhmCibeT1eeefWVRAC7ggw5Qa/mqLvhNi6jv9h7wxeWFBX4b2eV8z60tF4e29AYI
         Pl9PvCd2pIVopz3r2UQKTlXdeRY+sq1T9/ZcfT6GEhP8JM1fzfIwtIDerllu6ixfvnAC
         +hhDtK1EtG5uMVH+DwPkZ3262Q1UaEEYXMymrxgGf7Ec6gQ2Gv2BfBBBOC9X6XWNJ8LL
         PZbsX9W3QoGjq+5We40bipIwNEXwblH98oR61j2he5wYrTfaaYR0rOKYVa6vZ5cFfkqH
         WJdnFCYYQ3GP/gv3zI1YWRwoMV4dBW5LxbbpWjZnrn+2Fy5GjcG5XgM964WwZo3yOO/3
         Ti5A==
X-Gm-Message-State: AOAM533ZU1Jbr14NOUbiFrea5IVcVYfZ4zeuAjRp7FSEPMYYfLw2Kxiy
	8gPk52fbBFqpE0rPVTdQP0/wHg==
X-Google-Smtp-Source: ABdhPJzVYXUN6r/IJApcDUm6UWvGt+Pc0nTEW4dr/Fc3NSBuk8Ji5icIe1FeTVzEqqO0lZMf55Lslg==
X-Received: by 2002:a63:5050:: with SMTP id q16mr1154831pgl.318.1623171821714;
        Tue, 08 Jun 2021 10:03:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o16sm14115459pjw.10.2021.06.08.10.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 10:03:41 -0700 (PDT)
Date: Tue, 8 Jun 2021 10:03:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	regressions@lists.linux.dev
Subject: Re: Regression when writing to /proc/<pid>/attr/
Message-ID: <202106081003.2BECE93@keescook>
References: <20210607142245.eikvyeacqwwu6dn3@wittgenstein>
 <202106071621.C11535A@keescook>
 <CAHk-=wg8Bqjf8vxythgN9EV-XTttf7GXeus14kDkVZuUwLibrw@mail.gmail.com>
 <202106071856.5D68C05638@keescook>
 <YL8Rwb1Pnbdwk0xc@xps-13-7390>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL8Rwb1Pnbdwk0xc@xps-13-7390>

On Tue, Jun 08, 2021 at 08:44:17AM +0200, Andrea Righi wrote:
> On Mon, Jun 07, 2021 at 07:15:36PM -0700, Kees Cook wrote:
> > On Mon, Jun 07, 2021 at 05:02:28PM -0700, Linus Torvalds wrote:
> > > On Mon, Jun 7, 2021 at 4:38 PM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > I'm assuming the issue is the latter (open, drop privs, write). And
> > > > I assume fsuid/fsgid has changed? (i.e. cred_fscmp() couldn't be used
> > > > either?)
> > > 
> > > Hmm. Do we have some place to hide self_exec_id at open time, and then
> > > just verify that it's still the same at IO time?
> > > 
> > > IOW, replace that f_cred comparison with a "self_exec_id has not
> > > changed" comparison instead?
> > 
> > I think we can't use self_exec_id because the original flaw could just
> > be changed to have the parent open two children (the fd opener and the
> > victim), which would have the same self_exec_id.
> > 
> > > Perhaps squirrel it away in file->f_private? Or are we already using
> > > that (didn't check)?
> > 
> > But we can do tracking via file->private_data since the attr files don't
> > use a custom opener. I think an mm_struct comparison is likely what's
> > needed here? (This is actually what several of these special proc files
> > are already doing, but they actually _use_ mm_struct.)
> > 
> > UNTESTED:
> 
> Thanks Kees! Comparing mm_struct makes sense to me. With this applied
> the regression that I was experiencing with containers doesn't happen
> anymore.
> 
> I'll run more stress tests with this, but for now it looks good to me,
> so FWIW:
> 
> Tested-by: Andrea Righi <andrea.righi@canonical.com>

Oh good! Thanks for testing and sorry for the extra work I created! I'll
get this spun up into a proper patch.

-Kees

> 
> > 
> > 
> > diff --git a/fs/proc/base.c b/fs/proc/base.c
> > index 58bbf334265b..7118ebe38fa6 100644
> > --- a/fs/proc/base.c
> > +++ b/fs/proc/base.c
> > @@ -2674,6 +2674,11 @@ static int proc_pident_readdir(struct file *file, struct dir_context *ctx,
> >  }
> >  
> >  #ifdef CONFIG_SECURITY
> > +static int proc_pid_attr_open(struct inode *inode, struct file *file)
> > +{
> > +	return __mem_open(inode, file, PTRACE_MODE_READ_FSCREDS);
> > +}
> > +
> >  static ssize_t proc_pid_attr_read(struct file * file, char __user * buf,
> >  				  size_t count, loff_t *ppos)
> >  {
> > @@ -2704,7 +2709,7 @@ static ssize_t proc_pid_attr_write(struct file * file, const char __user * buf,
> >  	int rv;
> >  
> >  	/* A task may only write when it was the opener. */
> > -	if (file->f_cred != current_real_cred())
> > +	if (file->private_data != current->mm)
> >  		return -EPERM;
> >  
> >  	rcu_read_lock();
> > @@ -2754,9 +2759,11 @@ static ssize_t proc_pid_attr_write(struct file * file, const char __user * buf,
> >  }
> >  
> >  static const struct file_operations proc_pid_attr_operations = {
> > +	.open		= proc_pid_attr_open,
> >  	.read		= proc_pid_attr_read,
> >  	.write		= proc_pid_attr_write,
> >  	.llseek		= generic_file_llseek,
> > +	.release	= mem_release,
> >  };
> >  
> >  #define LSM_DIR_OPS(LSM) \
> > 
> > -- 
> > Kees Cook

-- 
Kees Cook
