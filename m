Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5748023BD17
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 02:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791598661; cv=none; b=nTs8aa8auR9ngeS4UURpGHtUt4S8y+w3gXqVgU/LCx9/+qufslUDYN74iEzeE4oFx6XSvyx2aDtG7lK0gxqBdQQd9K9SzjN7dfC1Tx/Sd3c+KJuPUnmkMMbWwbkL62izBk5Kw1w4FCkBKHP+6gZ5XkZ13cGGxCjb/7Q3JdgfAy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791598661; c=relaxed/simple;
	bh=gYpbgl2GZgyL4Hg+QxycNzx80e45YZlInf4plZKf8V8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwXjpuPCgddyWGuQBo9DY5HMoD9cTN2eZpdZXdTS0/aHqNbdcGrsJhh98Pxmaee5v8bwWETRYgVSyeyl/mmseqrpyT7XdIG6FKm32tWF+lIZZQdyVrzlGmfnN5KPIBgJC1kD7ATHR5eYDbQjrE25hxrmW/6fDO4ahlDM/FW51co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRcbgkF9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRcbgkF9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F339B1F000FF
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 02:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791598659;
	bh=WFDctbzgPknbzeG/yi0t3GFYlXJxdai12qYrzoDBQyk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RRcbgkF9mi9YSm5B8vC4lQODEEJNGBrhmpXUmf8qCt0+hYQPFbGAp/WD6D+oj/wJv
	 lpqcdXEocjzOhEtm0GoqoBCFb5siT9ITmLwwDL94OxkeJFU11GWyqoQq0SXprgZPcD
	 KxK0YsxbAOFFlxWhXPYwrzDiwtKdo7KcZ5Y6urWJgXa5FO8wi7IXZfzU4FMDyyW0sS
	 tNatJvIgmgTlfv/a2iUvG2s16T6tx5/VVbT+o4utIdCf40R0Ealp5/SSVxLl9G8c2A
	 uuXbFBRkGlvvxorrcbclQ5BctYmCBXIVFzD9c5bx0dz/fz579GxAxjqK0v8j4yglto
	 sLRePByXClXog==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1755b8c10so330538a12.3
        for <regressions@lists.linux.dev>; Fri, 09 Oct 2026 19:17:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy77qyptXs2jzFQN1bWnesM94tpj3A4iK1aYKTF3qv8EQuHArV/NBz9rb0jFJWhzicL9JLegBiGmTPdZw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLP1UKyd+xlASUD3rr7hqyAUd6SBAhyMxzzKZ8RkBNFRfKahj9D
	sWw5w3KmRTUSp9ue8XBCcMvGHAP+dyEN12JJ5eZ4qGcGQSn64trIWSutxF5bIOfX6UwEGF47mOS
	7RJ6KUS1yG5/Wd4Q1UYUt8zkBILCz8GQ=
X-Received: by 2002:a17:907:8686:b0:c31:6ba6:3108 with SMTP id
 a640c23a62f3a-c31aa0f6588mr379464366b.47.1791598657585; Fri, 09 Oct 2026
 19:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <010001a1222f66ba-0c745f29-d4fe-4862-93ff-1db2055b05fc-000000@email.amazonses.com>
In-Reply-To: <010001a1222f66ba-0c745f29-d4fe-4862-93ff-1db2055b05fc-000000@email.amazonses.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 10 Oct 2026 11:17:25 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9EkVrdKjsmcd96OFc7pf=2WA8KMUBhRPZROkUOdkV=SA@mail.gmail.com>
X-Gm-Features: AclHuK9CnmF-Cf56ITpAxH0BBJD0BVV6mYdsFpm31QpZauc77VpyFsAA04zJ4o0
Message-ID: <CAKYAXd9EkVrdKjsmcd96OFc7pf=2WA8KMUBhRPZROkUOdkV=SA@mail.gmail.com>
Subject: Re: [REGRESSION 7.2] exfat: stale dentry buffer of a deleted
 directory overwrites new file data
To: nfalesy@gmail.com
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, hch@lst.de, djwong@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

> A candidate fix (not a formal patch; tested only with this
> reproducer, all cases above 0/N on v7.3-rc6 with it applied):
>
> --- a/fs/exfat/iomap.c
> +++ b/fs/exfat/iomap.c
> @@ -7,6 +7,7 @@
>
>  #include <linux/iomap.h>
>  #include <linux/pagemap.h>
> +#include <linux/buffer_head.h>
>
>  #include "exfat_raw.h"
>  #include "exfat_fs.h"
> @@ -77,6 +78,21 @@
>         if (err)
>                 goto out;
>
> +       /*
> +        * New clusters may still have dirty buffer_heads in the bdev
> +        * mapping (e.g. dentries of a just-removed directory).  Drop
> +        * them, as __block_write_begin_int() did for buffer_new
> +        * blocks, so a later bdev flush cannot write stale metadata
> +        * over the new file data.
> +        */
> +       if (balloc) {
> +               sector_t first = exfat_cluster_to_sector(sbi, cluster);
> +               sector_t nr = (sector_t)num_clusters <<
> +                             sbi->sect_per_clus_bits;
> +
> +               clean_bdev_aliases(sb->s_bdev, first, nr);
> +       }
> +
>         cluster_offset = exfat_cluster_offset(sbi, offset);
>         cluster_length = exfat_cluster_to_bytes(sbi, num_clusters);
Thanks for the report and fixes! Your fix seems to miss clusters
allocated by fallocate() or an extending ftruncate(). These operations
allocate clusters before data I/O, so balloc is false when the
clusters are later mapped for writing, and clean_bdev_aliases() can be
skipped. Could you send a patch that moves the cleanup to
exfat_alloc_cluster(), using one call per contiguous range?
