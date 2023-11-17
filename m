Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495FDEAF9
	for <regressions@lists.linux.dev>; Fri, 17 Nov 2023 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bLTWf1vA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700212124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwkYD2KSvLsNr42XYYYBqulY61ruhRC+SJXpVF+jdgs=;
	b=bLTWf1vA4AunnJEiqxKg280jnnz6NDn0o7KZiARsftTokRCU7bDu+9hHkAjI4ICI3fPD4p
	fWQByVotCOuzJF8v3v0xZ+vvgNNlwOxdmtbXHXPVabvmtQulqUTOcoHgZuvasIEfgwEpUX
	QYpqHehc24vJMCUIU3ytVbc2dng6u2E=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-BDJP5N9lMyCt9gSs1BfIRQ-1; Fri, 17 Nov 2023 04:08:41 -0500
X-MC-Unique: BDJP5N9lMyCt9gSs1BfIRQ-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2802c0b610dso2638161a91.1
        for <regressions@lists.linux.dev>; Fri, 17 Nov 2023 01:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700212120; x=1700816920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwkYD2KSvLsNr42XYYYBqulY61ruhRC+SJXpVF+jdgs=;
        b=A4pcVuKd7g/Zl1vvgZB431Hgqn6pI8Ye2BVY76niQaER4hvEpyyY0NfahMLxb4aoVx
         0ox88jmvdRo8V29ffdBhIczh4qGAiO+ToLHinIGFMD5oqUD9hhrYgij1RslS5aTbHDAS
         EObuFejTrGgB0Xxr2v4LnAnHypWKEHB8lS+fRax9UcQw55j1JMES5+EZkLsjvPyoIGLg
         +UZcBfC15nk3iJI3sScEtZgiPrKt3FKiHdtEdfLkHf7XB78pCJ9+HJPx2RAupDsE0hkv
         tH82aSAxRcX33o5YEDt1NX86gq8Qk3pTm+M3QzSqLnl/AU0q90UmqbaTZFem4RemNkcQ
         AVWw==
X-Gm-Message-State: AOJu0YyCVCP7hL8ARbaamG6v1gOqPvfs9z2ZeOyxKwR4uQpH9Vsn9KbH
	r3q+e0i97mcODWWvqloNAZpsmAYOPND3yQv94xDt4zV8f9lSvAp3NqQ+fVNPScmyaJo/P55qa5y
	vIPyyf784M5MLR22DcjWbxLX0jjft9QaEOcuOE3Y=
X-Received: by 2002:a17:90b:1647:b0:27d:853:9109 with SMTP id il7-20020a17090b164700b0027d08539109mr17740134pjb.20.1700212120103;
        Fri, 17 Nov 2023 01:08:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa6NzKLjGTFNPzHZdQXDE+LXkkVkmDt5U0jix4+1w8qoU5C0zWBUBVyLKvoUsQ/jRm0UNA6r52YsMFtZC4lsY=
X-Received: by 2002:a17:90b:1647:b0:27d:853:9109 with SMTP id
 il7-20020a17090b164700b0027d08539109mr17740118pjb.20.1700212119718; Fri, 17
 Nov 2023 01:08:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5727380.DvuYhMxLoT@bvd0> <CAPhsuW4+Ktd7mzTQ6M4n9-=8vgyMDJUi8Xkcv50JXTf_2yqTFA@mail.gmail.com>
In-Reply-To: <CAPhsuW4+Ktd7mzTQ6M4n9-=8vgyMDJUi8Xkcv50JXTf_2yqTFA@mail.gmail.com>
From: Xiao Ni <xni@redhat.com>
Date: Fri, 17 Nov 2023 17:08:28 +0800
Message-ID: <CALTww29LApgdNXKJfKQHR-AwUiAjtzGsDV1igOXhZTOoB6e3uQ@mail.gmail.com>
Subject: Re: [REGRESSION] Data read from a degraded RAID 4/5/6 array could be
 silently corrupted.
To: Song Liu <song@kernel.org>
Cc: Bhanu Victor DiCara <00bvd0+linux@gmail.com>, Mateusz Grzonka <mateusz.grzonka@intel.com>, 
	linux-raid@vger.kernel.org, regressions@lists.linux.dev, 
	jiangguoqing@kylinos.cn, jgq516@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all

I can reproduce this quickly with the commands mentioned at
https://www.spinics.net/lists/raid/msg73521.html in my environment.
After several hours test, this problem hasn't happened. This patch
works for me

Tested-by: Xiao Ni <xni@redhat.com>

On Fri, Nov 17, 2023 at 12:25=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> + more folks.
>
> On Fri, Nov 10, 2023 at 7:00=E2=80=AFPM Bhanu Victor DiCara
> <00bvd0+linux@gmail.com> wrote:
> >
> > A degraded RAID 4/5/6 array can sometimes read 0s instead of the actual=
 data.
> >
> >
> > #regzbot introduced: 10764815ff4728d2c57da677cd5d3dd6f446cf5f
> > (The problem does not occur in the previous commit.)
> >
> > In commit 10764815ff4728d2c57da677cd5d3dd6f446cf5f, file drivers/md/rai=
d5.c, line 5808, there is `md_account_bio(mddev, &bi);`. When this line (an=
d the previous line) is removed, the problem does not occur.
>
> The patch below should fix it. Please give it more thorough tests and
> let me know whether it fixes everything. I will send patch later with
> more details.
>
> Thanks,
> Song
>
> diff --git i/drivers/md/md.c w/drivers/md/md.c
> index 68f3bb6e89cb..d4fb1aa5c86f 100644
> --- i/drivers/md/md.c
> +++ w/drivers/md/md.c
> @@ -8674,7 +8674,8 @@ static void md_end_clone_io(struct bio *bio)
>         struct bio *orig_bio =3D md_io_clone->orig_bio;
>         struct mddev *mddev =3D md_io_clone->mddev;
>
> -       orig_bio->bi_status =3D bio->bi_status;
> +       if (bio->bi_status)
> +               orig_bio->bi_status =3D bio->bi_status;
>
>         if (md_io_clone->start_time)
>                 bio_end_io_acct(orig_bio, md_io_clone->start_time);
>
>
> >
> > Similarly, in commit ffc253263a1375a65fa6c9f62a893e9767fbebfa (v6.6), f=
ile drivers/md/raid5.c, when line 6200 is removed, the problem does not occ=
ur.
> >
> >
> > Steps to reproduce the problem (using bash or similar):
> > 1. Create a degraded RAID 4/5/6 array:
> > fallocate -l 2056M test_array_part_1.img
> > fallocate -l 2056M test_array_part_2.img
> > lo1=3D$(losetup --sector-size 4096 --find --nooverlap --direct-io --sho=
w  test_array_part_1.img)
> > lo2=3D$(losetup --sector-size 4096 --find --nooverlap --direct-io --sho=
w  test_array_part_2.img)
> > # The RAID level must be 4 or 5 or 6 with at least 1 missing drive in a=
ny order. The following configuration seems to be the most effective:
> > mdadm --create /dev/md/tmp_test_array --level=3D4 --raid-devices=3D3 --=
chunk=3D1M --size=3D2G  $lo1 missing $lo2
> >
> > 2. Create the test file system and clone it to the degraded array:
> > fallocate -l 4G test_fs.img
> > mke2fs -t ext4 -b 4096 -i 65536 -m 0 -E stride=3D256,stripe_width=3D512=
 -L test_fs  test_fs.img
> > lo3=3D$(losetup --sector-size 4096 --find --nooverlap --direct-io --sho=
w  test_fs.img)
> > mount $lo3 /mnt/1
> > python3 create_test_fs.py /mnt/1
> > umount /mnt/1
> > cat test_fs.img > /dev/md/tmp_test_array
> > cmp -l test_fs.img /dev/md/tmp_test_array  # Optionally verify the clon=
e
> > mount --read-only $lo3 /mnt/1
> >
> > 3. Mount the degraded array:
> > mount --read-only /dev/md/tmp_test_array /mnt/2
> >
> > 4. Compare the files:
> > diff -q /mnt/1 /mnt/2
> >
> > If no files are detected as different, do `umount /mnt/2` and `echo 2 >=
 /proc/sys/vm/drop_caches`, and then go to step 3.
> > (Doing `echo 3 > /proc/sys/vm/drop_caches` and then going to step 4 is =
less effective.)
> > (Only doing `umount /mnt/2` and/or `echo 1 > /proc/sys/vm/drop_caches` =
is much less effective and the effectiveness wears off.)
> >
> >
> > create_test_fs.py:
> > import errno
> > import itertools
> > import os
> > import random
> > import sys
> >
> >
> > def main(test_fs_path):
> >         rng =3D random.Random(0)
> >         try:
> >                 for i in itertools.count():
> >                         size =3D int(2**rng.uniform(12, 24))
> >                         with open(os.path.join(test_fs_path, str(i).zfi=
ll(4) + '.bin'), 'xb') as f:
> >                                 f.write(b'\xff' * size)
> >                         print(f'Created file {f.name!r} with size {size=
}')
> >         except OSError as e:
> >                 if e.errno !=3D errno.ENOSPC:
> >                         raise
> >                 print(f'Done: {e.strerror} (partially created file {f.n=
ame!r})')
> >
> >
> > if __name__ =3D=3D '__main__':
> >         main(sys.argv[1])
> >
> >
> >
>

