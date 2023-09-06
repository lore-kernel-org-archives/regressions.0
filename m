Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CF53FEF
	for <regressions@lists.linux.dev>; Wed,  6 Sep 2023 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693996081; x=1725532081;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xi2arI2T8vGuQePjOisCBAGoEzD7ON/P0tWYno67vjY=;
  b=hvjzsRvhSYapMSjaohvRsvbFwmSUyQVS8jkuh3rrWYgFyArheoKGx8uq
   KBP5W2HwEmKk+F5LE046N8m9FYjDoetPjw0XeweyB1ytEn8XYFAOXYgkH
   xS0HHErxsVSRU5qAJnORwatPNvQMwUotHlHVAvGxAZcKDxnaih2pUl4DR
   0HALIEs74O97XbJ8QTk8A7injZbOem3gHtRyX52IMbXXBCeEUQSEk5eiI
   nEBM0kFMdDZhi3GBLcgHNagTJkofKGK2+tBvo5iK58966ZXl0qiBmjc6a
   4DU7av83FHclFtlsUVYrSzjNYl52wH/WGllpBCbWXJ/QqnQtp3qs2d6SS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="379740998"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="379740998"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 03:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="811603688"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="811603688"
Received: from mtkaczyk-mobl.ger.corp.intel.com (HELO localhost) ([10.249.138.106])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 03:27:56 -0700
Date: Wed, 6 Sep 2023 12:27:51 +0200
From: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
To: AceLan Kao <acelan@gmail.com>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, Song Liu <song@kernel.org>, Guoqing
 Jiang <guoqing.jiang@linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Regressions
 <regressions@lists.linux.dev>, Linux RAID <linux-raid@vger.kernel.org>,
 "yukuai (C)" <yukuai3@huawei.com>
Subject: Re: Infiniate systemd loop when power off the machine with multiple
 MD RAIDs
Message-ID: <20230906122751.00001e5b@linux.intel.com>
In-Reply-To: <CAMz9Wg8bhCG=qSLia943dwr=LV7Kum=bZPq2s_2coV6a_bmDeA@mail.gmail.com>
References: <028a21df-4397-80aa-c2a5-7c754560f595@gmail.com>
	<20230818101630.000027f4@linux.intel.com>
	<b0488ff7-10c8-4b4e-28b8-01809133c297@linux.dev>
	<CAPhsuW6cSLqwRVO_EpFyimvc7hgi1rb3T8-NA+stHdwrqrScBA@mail.gmail.com>
	<20230822083923.00007fb6@linux.intel.com>
	<CAMz9Wg8KE1rDkSaQnUTJ5ikzH7YGGYbkLM3AcrVue3=JgK+14w@mail.gmail.com>
	<35130b3f-c0fd-e2d6-e849-a5ceb6a2895f@linux.dev>
	<CAMz9Wg_zKSJ2vL=r2zAtLBOv4GSMT63+ZQGXfYTjVJsE+DLQGA@mail.gmail.com>
	<CAPhsuW6W0XgFjH1zNC+EFYjujd4smEiWs+-nYCWQ+KaFmbuvkg@mail.gmail.com>
	<CAMz9Wg9y52iuxJRSQFC2N5Katt72v-o=JvEjegJt-MwORmw9tQ@mail.gmail.com>
	<CAPhsuW7XEy4q3XR389F7CUvXvJ=0JR0QkMOr4LU03avT0erAfg@mail.gmail.com>
	<354004ce-ad4e-5ad5-8fe6-303216647e0c@huaweicloud.com>
	<03b79ab0-0bb0-ac29-4a70-37d902f9a05b@huaweicloud.com>
	<20230831085057.00001795@linux.intel.com>
	<CAMz9Wg8bhCG=qSLia943dwr=LV7Kum=bZPq2s_2coV6a_bmDeA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 Sep 2023 14:26:30 +0800
AceLan Kao <acelan@gmail.com> wrote:

> From previous testing, I don't think it's an issue in systemd, so I
> did a simple test and found the issue is gone.
> You only need to add a small delay in md_release(), then the issue
> can't be reproduced.
> 
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 78be7811a89f..ef47e34c1af5 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -7805,6 +7805,7 @@ static void md_release(struct gendisk *disk)
> {
>        struct mddev *mddev = disk->private_data;
> 
> +       msleep(10);
>        BUG_ON(!mddev);
>        atomic_dec(&mddev->openers);
>        mddev_put(mddev);

I have repro and I tested it on my setup. It is not working for me.
My setup could be more "advanced" to maximalize chance of reproduction:

# cat /proc/mdstat
Personalities : [raid1] [raid6] [raid5] [raid4] [raid10] [raid0]
md121 : active raid0 nvme2n1[1] nvme5n1[0]
      7126394880 blocks super external:/md127/0 128k chunks

md122 : active raid10 nvme6n1[3] nvme4n1[2] nvme1n1[1] nvme7n1[0]
      104857600 blocks super external:/md126/0 64K chunks 2 near-copies [4/4]
[UUUU]

md123 : active raid5 nvme6n1[3] nvme4n1[2] nvme1n1[1] nvme7n1[0]
      2655765504 blocks super external:/md126/1 level 5, 32k chunk, algorithm 0
[4/4] [UUUU]

md124 : active raid1 nvme0n1[1] nvme3n1[0]
      99614720 blocks super external:/md125/0 [2/2] [UU]

md125 : inactive nvme3n1[1](S) nvme0n1[0](S)
      10402 blocks super external:imsm

md126 : inactive nvme7n1[3](S) nvme1n1[2](S) nvme6n1[1](S) nvme4n1[0](S)
      20043 blocks super external:imsm

md127 : inactive nvme2n1[1](S) nvme5n1[0](S)
      10402 blocks super external:imsm

I have almost 99% repro ratio, slowly moving forward..

It is endless loop because systemd-shutdown sends ioctl "stop_array" which is
successful but array is not stopped. For that reason it sets "changed = true".

Systemd-shutdown see the change and retries to check if there is something else
which can be stopped now, and again, again...

I will check what is returned first, it could be 0 or it could be positive
errno (nit?) because systemd cares "if(r < 0)".

Thanks,
Mariusz
