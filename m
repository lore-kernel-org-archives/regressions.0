Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC541AF4E9;
	Tue, 24 Dec 2024 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735034390; cv=none; b=rnExPDa3Jk+a85Xb3w2QHks7vz+4jMt6l/G63VeWovqio+JTpjsjH3UL4PEFmL6VYN1Lob0X9XlDbvp/ARFGWmMimq3kYif/GltG0Mx4BWxULCkxLB3sM0arUGbTcuXPP/mXmi3EXKQX8Fo0+gy3U7c2WFp1E1t3I2TA/MQM+NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735034390; c=relaxed/simple;
	bh=uVXDQpKxvUgof3vd8dijg6f2wM9tZGhj+GNZAov5yHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWoXqbTMxofZEfC6GZv9laCPg8prkXboW83WZaDXStxal8hIO5IewSY4Q3DnvsTe0Oyz80/Xd9TDr25Nx+rVcbeAylKgy6Q5odHHRm/9xOrtenRnwMISD7YjiMrR2o36x3JSgK9ioA1NNJzjONCFTPaZtxVWjRp5v4Sp4ymKmmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d2kS7tjN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d2kS7tjN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85DBC4CED0;
	Tue, 24 Dec 2024 09:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735034390;
	bh=uVXDQpKxvUgof3vd8dijg6f2wM9tZGhj+GNZAov5yHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2kS7tjNMNP0pE59liRa7vbUDZHnnOdZiEI3uMBuC2dcKFFMTcdZhGxqGguv4ZqNB
	 qObseyE76I6iTEU2BjDeq1rX4Pzy2UrEOAAGiBARjBh3U94mtZUtdQjt7dXNrgf3Iu
	 G560rnLSNGvyMGzjup47vJFxdeAAgakPhrWQLIVI=
Date: Tue, 24 Dec 2024 10:59:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhao Mengmeng <zhaomengmeng@kylinos.cn>
Cc: Jan Kara <jack@suse.cz>, sashal@kernel.org,
	Salvatore Bonaccorso <carnil@debian.org>,
	Daniel Reichelt <debian@nachtgeist.net>,
	linux-kernel@vger.kernel.org, 1089698@bugs.debian.org,
	regressions@lists.linux.dev
Subject: Re: [regression] linux: Loop-mounted UDF ISOs no longer readable
Message-ID: <2024122420-litter-cadillac-53cd@gregkh>
References: <Z2XKY0f6on1UbwWb@eldamar.lan>
 <b681e1ea-bb7d-4d8f-b62c-cae1e4116d21@kylinos.cn>
 <6c8e6c68-b0a1-47b4-82a4-c68490fdc876@kylinos.cn>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c8e6c68-b0a1-47b4-82a4-c68490fdc876@kylinos.cn>

On Tue, Dec 24, 2024 at 05:46:59PM +0800, Zhao Mengmeng wrote:
> On 2024/12/23 10:48, Zhao Mengmeng wrote:
> > On 2024/12/21 03:49, Salvatore Bonaccorso wrote:
> >> Hi Jan, hi Zhao,
> >>
> >> In Debian we got he following report, full quoted below from Daniel
> >> Reichelt, dass after updating to 6.1.115 (and later, confirmed up to
> >> 6.1.119), loop-mounted UDF ISOs are no longer readable:
> > 
> > Sorry to hear that...
> > 
> >>> Hi,
> >>>
> >>> in 6.1.112-1 I could loop-mount Windows Setup ISOs (downloaded from M$; hashes
> >>> are fine; 10/11, DE/EN don't seem to make any difference) and access their
> >>> content perfectly fine, i.e. share the /sources/ sub-directory via samba for
> >>> netinstall scenarios.
> >>>
> >>> Starting with 6.1.115-1, the ISOs can be mounted, the root-dir is accessible
> >>> and `stat $mntpt/sources` gives output as well. However `ls $mntpt/sources`
> >>> hangs and the kernel log is spammed with entries like
> >>>
> >>> ---------------8<-------------------------
> >>> 2024-12-11T14:53:19.616728+01:00 srv kernel: [182394.024828] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> >>> 2024-12-11T14:53:19.629970+01:00 srv kernel: [182394.038041] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> >>> 2024-12-11T14:53:19.641623+01:00 srv kernel: [182394.049714] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> >>> 2024-12-11T14:53:19.654841+01:00 srv kernel: [182394.062928] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> >>> 2024-12-11T14:53:19.666495+01:00 srv kernel: [182394.074615] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> >>> 2024-12-11T14:53:19.679747+01:00 srv kernel: [182394.087833] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> >>> 2024-12-11T14:53:19.691394+01:00 srv kernel: [182394.099510] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> >>> 2024-12-11T14:53:19.704646+01:00 srv kernel: [182394.112727] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> >>> 2024-12-11T14:53:19.716283+01:00 srv kernel: [182394.124400] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> >>> 2024-12-11T14:53:19.729539+01:00 srv kernel: [182394.137618] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> >>> 2024-12-11T14:53:19.741185+01:00 srv kernel: [182394.149279] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> >>> 2024-12-11T14:53:19.754422+01:00 srv kernel: [182394.162494] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> >>> 2024-12-11T14:53:19.766071+01:00 srv kernel: [182394.174159] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> >>> 2024-12-11T14:53:19.779289+01:00 srv kernel: [182394.187375] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> >>> ---------------8<-------------------------
> >>>
> >>>
> >>> 6.1.119-1 shows the same behaviour.
> >>> Let me know if you need additional info.
> >>
> >> We have not a full bisect, but Daniel confirmed already in
> >> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1089698#22 some
> >> observations:
> >>
> >>> OK:
> >>>   6.1.112-1
> >>> BAD:
> >>>   6.1.115-1
> >>>   6.1.119-1
> >>> OK again:
> >>>   6.3.1-1~exp1
> >>>   current trixie
> >>>   current sid
> >>
> >> (current trixie is 6.11.10 based kernel, current sid is based on
> >> 6.12.5 kernel).
> >>
> >> Dies this ring some bell to you?
> > 
> > I'll take a look at it. Will post it here if anything new founded.
> > 
> >> #regzbot introduced: v6.1.112..v6.1.115
> >> #regzbot monitor: https://bugs.debian.org/1089698
> >>
> >> Regards,
> >> Salvatore
> > 
> --------------------
> Update on 2024.12.24:
> 
> Hi Jan, Sasha, after some testing and code digging, I found that v6.1 LTS may need 
> this patch to solve Daniel's issue:
> 
> commit 1ea1cd11c72d1405a6b98440a9d5ea82dfa07166
> Author: Jan Kara <jack@suse.cz>
> Date:   Wed Jan 25 11:43:03 2023 +0100
> 
>     udf: Fix directory iteration for longer tail extents
>     
>     When directory's last extent has more that one block and its length is
>     not multiple of a block side, the code wrongly decided to move to the
>     next extent instead of processing the last partial block. This led to
>     directory corruption. Fix the rounding issue.
>     
>     Signed-off-by: Jan Kara <jack@suse.cz>

It's already queued up for the next 6.1.y release in a few days, so if
you could test the -rc that is out for review right now, that would be
great!

thanks,

greg k-h
