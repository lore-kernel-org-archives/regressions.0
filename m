Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0CD1FB1
	for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 06:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679467880; x=1711003880;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ylgya/uy4m5dg2f0yWBBb1jbOoNOCKIoIbUTuCbiP4c=;
  b=FjN3lqVVKsev6MTZbssgZwcj2Kg/nalq7XKHHJPq7295Xxwhw2h1gGZt
   6hUDOkOxSKJVy+CQoMTQmYD6W+0CXOgp4ZDZw1AWRKsc9To/Fcbg5xCvR
   EzZYWRNL4CNSxp3R9CFwXtXGwtNGEI2V+FnJEqoS70FIAjvxSBROtxHd2
   twaudHbL1chzciPN94FfzDBNXnYANDdGRJvGp9w8nviCj/9H59G2oJ9ao
   tGq1E0iX7HGwe/wRvQuy+x2Gu3Y7nMv/K4B9B7gPxnIXKrSvy6b4Se/OH
   bdP4YjOmq43ZviMF83RSxwlR2CzMXLaJUnIvhO6DFq6CS5FTNFWzNH+sG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401710167"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="401710167"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 23:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825267927"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="825267927"
Received: from mtkaczyk-mobl.ger.corp.intel.com (HELO localhost) ([10.252.62.75])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 23:51:16 -0700
Date: Wed, 22 Mar 2023 07:51:11 +0100
From: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
To: "NeilBrown" <neilb@suse.de>
Cc: "Xiao Ni" <xni@redhat.com>, "Jes Sorensen" <jes@trained-monkey.org>,
 "Song Liu" <song@kernel.org>, "Linux regressions mailing list"
 <regressions@lists.linux.dev>, "linux-raid" <linux-raid@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>, "Nikolay Kichukov"
 <hijacker@oldum.net>, Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH - mdadm] mdopen: always try create_named_array()
Message-ID: <20230322075111.000064bc@linux.intel.com>
In-Reply-To: <167945548970.8008.8910680813298326328@noble.neil.brown.name>
References: <167875238571.8008.9808655454439667586@noble.neil.brown.name>
	<CALTww2916uiO8_ViJQXutO2BPasFmiUJtfz8MxW0HKjDzwGFeQ@mail.gmail.com>
	<167945548970.8008.8910680813298326328@noble.neil.brown.name>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Mar 2023 14:24:49 +1100
"NeilBrown" <neilb@suse.de> wrote:

> On Wed, 22 Mar 2023, Xiao Ni wrote:
> > On Tue, Mar 14, 2023 at 8:08=E2=80=AFAM NeilBrown <neilb@suse.de> wrote=
: =20
> > >
> > >
> > > mdopen() will use create_named_array() to ask the kernel to create the
> > > given md array, but only if it is given a number or name.
> > > If it is NOT given a name and is required to choose one itself using
> > > find_free_devnm() it does NOT use create_named_array().
> > >
> > > On kernels with CONFIG_BLOCK_LEGACY_AUTOLOAD not set, this can result=
 in
> > > failure to assemble an array.  This can particularly seen when the
> > > "name" of the array begins with a host name different to the name of =
the
> > > host running the command.
> > >
> > > So add the missing call to create_named_array().
> > >
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217074 =20
> >=20
> > Hi Neil
> >=20
> > I have two questions, hope you can help to understand the function
> > create_mddev better.
> >=20
> > Frist, from the comment7 of the bug you mentioned:
> >=20
> > There are two different sorts names.  Note that you almost
> > acknowledged this by writing "name for my md device node" while the
> > documentation only talks about names for "md devices", not for "md
> > device nodes".
> >=20
> > There are
> > 1/ there are names in /dev or /dev/md/ (device nodes)
> > 2/ there are names that appear in /proc/mdstat and in /sys/block/ (devi=
ces)
> >=20
> > Thanks for the clarification. But it looks like it doesn't work like
> > what you said.
> > For example:
> > mdadm -CR /dev/md/root -l0 -n2 /dev/sda /dev/sdc --name=3Dtest
> > cat /proc/mdstat
> > Personalities : [raid0]
> > md127 : active raid0 sdc[1] sda[0]
> >       3906764800 blocks super 1.2 512k chunks
> > cd /sys/block/md127/md/
> >=20
> > In /proc/mdstat and /sys/block, they all use md127 rather than the
> > name(root) =20
>=20
> Try again with "CREATE names=3Dyes" in /etc/mdadm.conf.
>=20
> mdadm generally tries to keep:
>   - the names in /dev/
>   - the names in /dev/md/
>   - the names in /proc/mdstat
>   - the names stored in the metadata
>=20
> in sync.  It can only do this when:
>  - you enabled "names=3Dyes"
>  - you don't confuse it by specifying a device name (/dev/md/root) that
>    is different from the metadata names "test".
>=20
> If you don't have "names=3Dyes" then the name in /proc/mdstat and the name
> in /dev/md* will be numeric.  The name in /dev/md/ and the name in the
> metadata can be different and will usually be the same.
>=20
> If you explicitly give a different name with --name=3D than the device
> name then obviously they will be different.  If you then stop the array
> and restart with "mdadm -As" or "mdadm -I /dev/sda; mdadm -I /dev/sdb"
> then mdadm will create a name in /dev/md/ that matches the name in the
> metadata.
>=20
> >=20
> > Before this patch,  it creates a symbol link with the name root rather =
than
> > test ll /dev/md/root
> > lrwxrwxrwx. 1 root root 8 Mar 21 22:35 /dev/md/root -> ../md127 =20
>=20
> That is what you asked it to do.
>=20
> >=20
> > So "test" which is specified by --name looks like it has little usage.
> >  =20
>=20
> It is stored in the metadata.  You can see it in --examine output.  If
> you reassemble the array without specifying a device name, it will use
> the name "test".
>=20
> >=20
> > By the way, after this patch, the symbol link /dev/md/root can't be
> > created anymore.
> > Is it a regression problem? =20
>=20
> I cannot reproduce any problem like that.  Please provide a sequence of
> steps so that I can try to duplicate it.

Hi,
It is not caused by this patch. Regression is caused by:
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=3D8a4ce2c05=
3866ac97feb436c4c85a54446ee0016

We noticed that yesterday.

In our case, udev fails to create link, timeout happens. This is caused by
missing MD_DEVNAME property in --detail --export. At that is all I know for=
 now.
Work in progress.

Steps:
#mdadm -CR imsm -e imsm -n4 /dev/nvme[0-3]n1
#mdadm -CR vol -l5 -n4 /dev/nvme[0-3]n1 --assume-clean

Thanks,
Mariusz

>=20
> >=20
> > Second, are there possibilities that the arguments "dev" and "name" of
> > function create_mddev
> > are null at the same time? =20
>=20
> No.  For Build or Create, dev is never NULL.  For Assemble and
> Incremental, name is never NULL.
>=20
>=20
> > After some tests, I found dev can't be null when creating a raid
> > device. It can be checked before
> > calling create_mddev. And we must get a name after creating a raid
> > device. So when assembling
> > a raid device, the name must not be null. So the dev and name can't be
> > null at the same time, right? =20
>=20
> Correct.
>=20
> NeilBrown
>=20
>=20
> >=20
> > Best Regards
> > Xiao
> >=20
> >  =20
> > > Signed-off-by: NeilBrown <neilb@suse.de>
> > > ---
> > >  mdopen.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/mdopen.c b/mdopen.c
> > > index d18c931996d2..810f79a3d19a 100644
> > > --- a/mdopen.c
> > > +++ b/mdopen.c
> > > @@ -370,6 +370,7 @@ int create_mddev(char *dev, char *name, int autof,
> > > int trustworthy, }
> > >                 if (block_udev)
> > >                         udev_block(devnm);
> > > +               create_named_array(devnm);
> > >         }
> > >
> > >         sprintf(devname, "/dev/%s", devnm);
> > > --
> > > 2.39.2
> > > =20
> >=20
> >  =20
>=20

