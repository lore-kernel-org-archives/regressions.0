Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B14528EF
	for <regressions@lists.linux.dev>; Tue, 14 Mar 2023 09:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678785082; x=1710321082;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WQVGzguMektICAtYLmM/lI9Il8wjM/11GOkoaszAIec=;
  b=EMUdkaTCzhf/w8doXbssmJaFxcar2Lw/vowcF6Zp06UDM8z+8WPibunI
   a0VxufPfFGYicRP3WiDvIJE1aR0kcZfuYKU1I2Zh8O0Um69BdylpRhD3q
   CFM1vpaN5kTS8RBHPfQ0PJ+ISbXzI2Q70vSKWEM91iaPJ0Lv0CEQAgRLf
   mdFWAOQhQdsZ+g6mB8Vm28X7lcdVuchRj74FQCBZEKah0BcTfWQhRs2Wp
   fhcipzsNhzRgfZ4JUmuPjlLod++pzILCoS4Ql+uYut/bGJsXv7lZyVuQN
   PexNwMANdjxQVm5WN64NFXxSZgqxUz1MIqCrcDWhKxaPzOf2IsdF8OX7N
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334853033"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="334853033"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 02:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="628977176"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="628977176"
Received: from mtkaczyk-mobl.ger.corp.intel.com (HELO localhost) ([10.252.32.139])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 02:11:18 -0700
Date: Tue, 14 Mar 2023 10:11:13 +0100
From: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
To: "NeilBrown" <neilb@suse.de>
Cc: Jes Sorensen <jes@trained-monkey.org>, "Song Liu" <song@kernel.org>,
 "Linux regressions mailing list" <regressions@lists.linux.dev>,
 "linux-raid" <linux-raid@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Nikolay Kichukov" <hijacker@oldum.net>
Subject: Re: [PATCH - mdadm] mdopen: always try create_named_array()
Message-ID: <20230314101113.000001fa@linux.intel.com>
In-Reply-To: <167875238571.8008.9808655454439667586@noble.neil.brown.name>
References: <167875238571.8008.9808655454439667586@noble.neil.brown.name>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Mar 2023 11:06:25 +1100
"NeilBrown" <neilb@suse.de> wrote:

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
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217074
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>  mdopen.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mdopen.c b/mdopen.c
> index d18c931996d2..810f79a3d19a 100644
> --- a/mdopen.c
> +++ b/mdopen.c
> @@ -370,6 +370,7 @@ int create_mddev(char *dev, char *name, int autof, int
> trustworthy, }
>  		if (block_udev)
>  			udev_block(devnm);
> +		create_named_array(devnm);
>  	}
>  
>  	sprintf(devname, "/dev/%s", devnm);

Hi Neil,
Thanks for handling that. I didn't have time to get into this topic yet.
I trust you and I believe that it is a good fix but I cannot verify it by
standard code review- the code is to complex. Could you please add test for it
to prove it works this way at least for following cases?
- mdadm -CR /dev/md/name
- mdadm -CR name
- mdadm -CR /dev/md_name
- mdadm -CR /dev/mdX, where X is a number.

You can disable creation via open temporarily by changing value in
/sys/module/md_mod/parameters/new_array that should be enough for verification.

For code:
Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>

Thanks,
Mariusz
