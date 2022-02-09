Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BCB2F2E
	for <regressions@lists.linux.dev>; Wed,  9 Feb 2022 07:55:16 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id y6so3653022ybc.5
        for <regressions@lists.linux.dev>; Tue, 08 Feb 2022 23:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eV794YHbVHS12HmSAomi+0BDrCTJ09pCtyoRkv+rxS4=;
        b=IaqQH2L1wqV8U/xN3pp1SpF/OBUrJpDXSlrwH7ehrNLbySHv9Wu27FnQCLrzuLW/9H
         0aEUMxpKbcOuYT3UfYeXlElDk4AtxnL1fiDwxlR9fidIi+pymWn+be3W4iP+LrhR1HIZ
         t3k30fqsdNDFaaxi8YXi/rO7TvALjKbenZuYkWpXm1YywZngNy7K1Hma2dRZV8dzNooF
         VVo+ma88TWMFfxjPhMjY4hJ5xBAc0GFFL6u5Rhn0e5HBKHTWYwQagu8p1JQ8+QopwgIM
         lyYnjdMQIW2Jyo/BUaUtMNebOs0Rb8aHZrdgvCb+UB1WLg2FOSn+lytIsJNPg367umDb
         IgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eV794YHbVHS12HmSAomi+0BDrCTJ09pCtyoRkv+rxS4=;
        b=avZlolxN4Lwl5hUds67IXnSQOutbydcpA6jBDsTKJBliEGsMvwo5tzOx/WDFvJYoHO
         JVWZGNqE656p6EFZX1fbPZazb6ScjG/ubyfTRy6D8DX/3F8RaItKZBW8cKSD/mAENwrt
         EacemS0g59xiv3AqAdHjvniU1CjvEf8RUVEhNkQVMtuYKGMfEkWCDEABkaSILsbEkhDt
         U8TxBkp/pIt9ByNTDfmGw7RD7tWqLZnASCzV7BcR3JKforCx4D2rJUAlPgVqbGvqN5jn
         i0dc7PYoCDw1Tr5lfz2mojI/NvzryOchFAIc6zFs+jQWq7pJkiX9FuJbtB41dmgHCn8T
         zYaQ==
X-Gm-Message-State: AOAM5307H+GU9aZsDhyC3zwjqRTtwySx8CwzOTXRLIlOaVmSaFn5Agxl
	J5WKP2f78+DSozXju6kX9kdpobaIKs+7w5jXP4s=
X-Google-Smtp-Source: ABdhPJyYT4RXELVDsNxwkCYFgUOkQSg0SKPK6EQFP3US4fA/3rH2ApxDKrTuSpdjytjxSGybeJS7lxyFXdGT7d71NZg=
X-Received: by 2002:a05:6902:4c2:: with SMTP id v2mr1053884ybs.429.1644393315563;
 Tue, 08 Feb 2022 23:55:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220121221021.60533b009c357d660791476e@linux-foundation.org>
 <20220122061228.nmuo75sDn%akpm@linux-foundation.org> <YgEeQNdgBuHRyEWl@dumbo>
 <YgGTSR628xhRvCjB@bombadil.infradead.org> <CAA5qM4BGmrkwatyO_h3F=ErDZ9t5swuttbt6NkQU-1KDGDiD4g@mail.gmail.com>
 <YgKmaggsipzzCGCg@bombadil.infradead.org> <YgNyAC8VMeuOD/uQ@dumbo>
In-Reply-To: <YgNyAC8VMeuOD/uQ@dumbo>
From: Tong Zhang <ztong0001@gmail.com>
Date: Tue, 8 Feb 2022 23:55:04 -0800
Message-ID: <CAA5qM4AkaYLxesaiy_X+ceEx0R9cXHdiLJE38v08bCjKXhxcMA@mail.gmail.com>
Subject: Re: [PATCH v2] Fix regression due to "fs: move binfmt_misc sysctl to
 its own file"
To: Domenico Andreoli <domenico.andreoli@linux.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	David Airlie <airlied@linux.ie>, Andrew Morton <akpm@linux-foundation.org>, amir73il@gmail.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, bcrl@kvack.org, 
	benh@kernel.crashing.org, clemens@ladisch.de, crope@iki.fi, 
	dgilbert@interlog.com, Greg KH <gregkh@linuxfoundation.org>, jack@suse.cz, 
	jani.nikula@intel.com, jani.nikula@linux.intel.com, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, jlbec@evilplan.org, john.ogness@linutronix.de, 
	joonas.lahtinen@linux.intel.com, Joseph Qi <joseph.qi@linux.alibaba.com>, 
	julia.lawall@inria.fr, Kees Cook <keescook@chromium.org>, kernel@tuxforce.de, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Fasheh <mark@fasheh.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, mm-commits@vger.kernel.org, 
	nixiaoming@huawei.com, penguin-kernel@i-love.sakura.ne.jp, 
	peterz@infradead.org, Phillip Potter <phil@philpotter.co.uk>, Paul Turner <pjt@google.com>, 
	pmladek@suse.com, rafael@kernel.org, rodrigo.vivi@intel.com, 
	rostedt@goodmis.org, senozhatsky@chromium.org, sre@kernel.org, steve@sk2.org, 
	Suren Baghdasaryan <surenb@google.com>, torvalds@linux-foundation.org, tytso@mit.edu, 
	Al Viro <viro@zeniv.linux.org.uk>, wangqing@vivo.com, 
	Iurii Zaikin <yzaikin@google.com>, open list <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 11:49 PM Domenico Andreoli
<domenico.andreoli@linux.com> wrote:
>
> Commit 3ba442d5331f did not go unnoticed, binfmt-support stopped to
> work on my Debian system since v5.17-rc2 (did not check with -rc1).
>
> The existance of the /proc/sys/fs/binfmt_misc is a precondition for
> attempting to mount the binfmt_misc fs, which in turn triggers the
> autoload of the binfmt_misc module. Without it, no module is loaded
> and no binfmt is available at boot.
>
> Building as built-in or manually loading the module and mounting the fs
> works fine, it's therefore only a matter of interaction with user-space.
> I could try to improve the Debian systemd configuration but I can't
> say anything about the other distributions.
>
> This patch restores a working system right after boot.
>
> v2:
> - move creation of fs/binfmt_misc to fs/file_table.c
> - use IS_ENABLED() to conditionally create it
>
> Fixes: 3ba442d5331f ("fs: move binfmt_misc sysctl to its own file")
> Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Amir Goldstein <amir73il@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Antti Palosaari <crope@iki.fi>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Benjamin LaHaise <bcrl@kvack.org>
> Cc: Clemens Ladisch <clemens@ladisch.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Douglas Gilbert <dgilbert@interlog.com>
> Cc: Eric Biederman <ebiederm@xmission.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Iurii Zaikin <yzaikin@google.com>
> Cc: James E.J. Bottomley <jejb@linux.ibm.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joel Becker <jlbec@evilplan.org>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Joseph Qi <joseph.qi@linux.alibaba.com>
> Cc: Julia Lawall <julia.lawall@inria.fr>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Lukas Middendorf <kernel@tuxforce.de>
> Cc: Mark Fasheh <mark@fasheh.com>
> Cc: Martin K. Petersen <martin.petersen@oracle.com>
> Cc: Paul Turner <pjt@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Phillip Potter <phil@philpotter.co.uk>
> Cc: Qing Wang <wangqing@vivo.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Stephen Kitt <steve@sk2.org>
> Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: "Theodore Ts'o" <tytso@mit.edu>
> Cc: Xiaoming Ni <nixiaoming@huawei.com>
>
> ---
>  fs/binfmt_misc.c |    6 +-----
>  fs/file_table.c  |    2 ++
>  2 files changed, 3 insertions(+), 5 deletions(-)
>
> Index: b/fs/binfmt_misc.c
> ===================================================================
> --- a/fs/binfmt_misc.c
> +++ b/fs/binfmt_misc.c
> @@ -817,20 +817,16 @@ static struct file_system_type bm_fs_typ
>  };
>  MODULE_ALIAS_FS("binfmt_misc");
>
> -static struct ctl_table_header *binfmt_misc_header;
> -
>  static int __init init_misc_binfmt(void)
>  {
>         int err = register_filesystem(&bm_fs_type);
>         if (!err)
>                 insert_binfmt(&misc_format);
> -       binfmt_misc_header = register_sysctl_mount_point("fs/binfmt_misc");
> -       return 0;
> +       return err;
>  }
>
>  static void __exit exit_misc_binfmt(void)
>  {
> -       unregister_sysctl_table(binfmt_misc_header);
>         unregister_binfmt(&misc_format);
>         unregister_filesystem(&bm_fs_type);
>  }
> Index: b/fs/file_table.c
> ===================================================================
> --- a/fs/file_table.c
> +++ b/fs/file_table.c
> @@ -119,6 +119,8 @@ static struct ctl_table fs_stat_sysctls[
>  static int __init init_fs_stat_sysctls(void)
>  {
>         register_sysctl_init("fs", fs_stat_sysctls);
> +       if (IS_ENABLED(CONFIG_BINFMT_MISC))
> +               register_sysctl_mount_point("fs/binfmt_misc");
>         return 0;
>  }
>  fs_initcall(init_fs_stat_sysctls);

Looks good
Thanks!

Reviewed-by: Tong Zhang <ztong0001@gmail.com>
