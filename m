Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3C963A7
	for <regressions@lists.linux.dev>; Thu,  9 Mar 2023 10:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD258C433EF;
	Thu,  9 Mar 2023 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678356458;
	bh=M2dk1uDWyM9XbA/9iJw/QbGme1KhQzfUYFQxVxzQLNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEntjhVOJ04K6CT97BtONkVeDVHjzL2CtbAmnXWisaI+NrKTzZmcJfdgMcRD3dNIp
	 HCM4sH+B6yA4khZP7RUNp/TmcT6MsSlS4p5gQLN9flG5nueU7mh2DUkebZ5pbvjYAB
	 CJngoXl5/X9Y4OUrz6GADsSuQ1nTY8wscdWZuPXs=
Date: Thu, 9 Mar 2023 11:07:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sylvain Menu <sylvain.menu@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	chuck.lever@oracle.com, jlayton@kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: nfs mount disappears due to inode revalidate failure
Message-ID: <ZAmv57xeNqs7v9hY@kroah.com>
References: <CACH9xG8-tEtWstUVmD9eZFEEAqx-E8Gs14wDL+=uNtBK=-KJvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACH9xG8-tEtWstUVmD9eZFEEAqx-E8Gs14wDL+=uNtBK=-KJvQ@mail.gmail.com>

On Thu, Mar 09, 2023 at 10:42:41AM +0100, Sylvain Menu wrote:
> Hello,
> 
> I am writing to report an issue on a nfs mount that disappears due to
> an inode revalide failure (already sent in January but probably banned
> with html format...).
> This very old commit
> (https://github.com/torvalds/linux/commit/cc89684c9a265828ce061037f1f79f4a68ccd3f7)
> exactly show the problem I have and this old resolved issue
> (https://bugzilla.kernel.org/show_bug.cgi?id=117651) is probably
> failing again today
> 
> To sum up, I have a NFS mount inside another NFS mount (for example:
> /opt/nfs/mount1 & /opt/nfs/mount1/mount2).
> If I kill a task trying to get a file descriptor on
> /opt/nfs/mount1/mount2 then it will be unmounted. My simple test code
> to reproduce very easily:
> 
> int main(int argc, char *argv[]) {
>     while (1) {
>         close(open(argv[1], O_RDONLY));
>     }
> }
> 
> In logs, I have: "nfs_revalidate_inode: (0:62/845965) getattr failed,
> error=-512"
> 
> Tested on 5.19 and 6.1 kernel

So is this a regression or something that has always been present?

thanks,

greg k-h
