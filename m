Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9AD15BA
	for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 03:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679454035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOIJJRSYJPLJPTd2GRDu3k3fbf9v92FQcFp9jB2hMk4=;
	b=EwDaiIL4iDfJgqR6dahZyA5ZNV+zsIDVKoYOls315PeNmF+zAnzp048PHOyR6D4FqM/kxo
	pWgnJ+TIZ751GoVSGa9bmSYMI9r9w+oibBwoOfxUagMtrVU8ylt1CMkH6osGYUs78uAqXZ
	BbTnbmB/y0hKpk58khXdo0Z0ICymm1k=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-zlxDX2lZOzSAJLTP3-_SvQ-1; Tue, 21 Mar 2023 23:00:34 -0400
X-MC-Unique: zlxDX2lZOzSAJLTP3-_SvQ-1
Received: by mail-pl1-f199.google.com with SMTP id l1-20020a170903244100b001a0468b4afcso9908001pls.12
        for <regressions@lists.linux.dev>; Tue, 21 Mar 2023 20:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679454033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOIJJRSYJPLJPTd2GRDu3k3fbf9v92FQcFp9jB2hMk4=;
        b=up3W9dmlp4dngPRzj/JftiFwnfZ55OxV32ZY5AWvTnKcYpyhtYeOV4NEgTOS6/CXnA
         s/20KgsJ1QvKVMQ6YlxjTfpJtJQGOcI8MeGMUHNNfJEC43twf4lKugVba3LKnXtJLP4Q
         oLAjC4auOumddV2zLT2mxMCEe/Imf3mVDaIh8+Due5eenpscPm5vx8obA1vlAOO43iIM
         A30h1/kPuPMNtv49kOxbMw/H/JPU8iR4HRy0iocHIxMQgrztYwiCwOakkKcxOXU5+4UN
         1/itBeZNtgIIAXrxTruFjiRbKPLDdUee5NGiDdQAWYLa/OpYJQvsGcXvXYiELkZO+8B9
         ZxfA==
X-Gm-Message-State: AO0yUKXTBSgLrkLoFobQ0iRY35YHLFCDxODWcCwhofI1zuV7qZTfiNPl
	4zcrW3eVERJlWki4+WHNHR6IdJ1GbSm85JjjDBtw1pz8tEX2pdAqG9ryU2Rgx/MeWe1z5lrRb9T
	u3CfMVGTtI4+pJu6Eq02OGYtK1a9uKlg//wLfGRE=
X-Received: by 2002:a05:6a00:1741:b0:625:ce35:432c with SMTP id j1-20020a056a00174100b00625ce35432cmr1158688pfc.5.1679454032866;
        Tue, 21 Mar 2023 20:00:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set+OLhW5K05NOdkAWcGB0tO28XfxJoJsLOqUHoqewkC8YHtyY8GS/pCKA/KQe5aZFhUh0RlGTpF7H+uDio60mew=
X-Received: by 2002:a05:6a00:1741:b0:625:ce35:432c with SMTP id
 j1-20020a056a00174100b00625ce35432cmr1158612pfc.5.1679454029570; Tue, 21 Mar
 2023 20:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <167875238571.8008.9808655454439667586@noble.neil.brown.name>
In-Reply-To: <167875238571.8008.9808655454439667586@noble.neil.brown.name>
From: Xiao Ni <xni@redhat.com>
Date: Wed, 22 Mar 2023 11:00:18 +0800
Message-ID: <CALTww2916uiO8_ViJQXutO2BPasFmiUJtfz8MxW0HKjDzwGFeQ@mail.gmail.com>
Subject: Re: [PATCH - mdadm] mdopen: always try create_named_array()
To: NeilBrown <neilb@suse.de>
Cc: Jes Sorensen <jes@trained-monkey.org>, 
	Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>, Song Liu <song@kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-raid <linux-raid@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Nikolay Kichukov <hijacker@oldum.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 8:08=E2=80=AFAM NeilBrown <neilb@suse.de> wrote:
>
>
> mdopen() will use create_named_array() to ask the kernel to create the
> given md array, but only if it is given a number or name.
> If it is NOT given a name and is required to choose one itself using
> find_free_devnm() it does NOT use create_named_array().
>
> On kernels with CONFIG_BLOCK_LEGACY_AUTOLOAD not set, this can result in
> failure to assemble an array.  This can particularly seen when the
> "name" of the array begins with a host name different to the name of the
> host running the command.
>
> So add the missing call to create_named_array().
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217074

Hi Neil

I have two questions, hope you can help to understand the function
create_mddev better.

Frist, from the comment7 of the bug you mentioned:

There are two different sorts names.  Note that you almost
acknowledged this by writing "name for my md device node" while the
documentation only talks about names for "md devices", not for "md
device nodes".

There are
1/ there are names in /dev or /dev/md/ (device nodes)
2/ there are names that appear in /proc/mdstat and in /sys/block/ (devices)

Thanks for the clarification. But it looks like it doesn't work like
what you said.
For example:
mdadm -CR /dev/md/root -l0 -n2 /dev/sda /dev/sdc --name=3Dtest
cat /proc/mdstat
Personalities : [raid0]
md127 : active raid0 sdc[1] sda[0]
      3906764800 blocks super 1.2 512k chunks
cd /sys/block/md127/md/

In /proc/mdstat and /sys/block, they all use md127 rather than the name(roo=
t)

Before this patch,  it creates a symbol link with the name root rather than=
 test
ll /dev/md/root
lrwxrwxrwx. 1 root root 8 Mar 21 22:35 /dev/md/root -> ../md127

So "test" which is specified by --name looks like it has little usage.

By the way, after this patch, the symbol link /dev/md/root can't be
created anymore.
Is it a regression problem?

Second, are there possibilities that the arguments "dev" and "name" of
function create_mddev
are null at the same time?
After some tests, I found dev can't be null when creating a raid
device. It can be checked before
calling create_mddev. And we must get a name after creating a raid
device. So when assembling
a raid device, the name must not be null. So the dev and name can't be
null at the same time, right?

Best Regards
Xiao


> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>  mdopen.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/mdopen.c b/mdopen.c
> index d18c931996d2..810f79a3d19a 100644
> --- a/mdopen.c
> +++ b/mdopen.c
> @@ -370,6 +370,7 @@ int create_mddev(char *dev, char *name, int autof, in=
t trustworthy,
>                 }
>                 if (block_udev)
>                         udev_block(devnm);
> +               create_named_array(devnm);
>         }
>
>         sprintf(devname, "/dev/%s", devnm);
> --
> 2.39.2
>

