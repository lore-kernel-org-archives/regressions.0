Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455E723E22B;
	Tue,  8 Apr 2025 08:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100188; cv=none; b=dwETRfmp0eg6Gv1d6Kr/4MHlesNbi85G4qEzT0ZfxfEsTRfi26BY7GT7NVFGslLSPhEqmL/J3tfP/Afd9JL8Pd8UPYTPBLtiuVI6pt5ztxLArOR0polglD327SqcwU5zKyDinKM406DcsFQlVF46/VZKB5YdJnBKjBH+fFh5+78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100188; c=relaxed/simple;
	bh=WE1ZZsKrmnSz2QHKwWvZ+H5UYZx+Uv7JHhT3+1LxJT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBS5VWssU8STHE2a2bEW0Wuapjz8XYir3TU3uuuvToQVr158VYQ1P5bsrZn+XtHv+2R8qR4nX9Vbpqk/8OHQXE58XS5seEyyBMG5uEky7k0pNCR5jz1wHxOOQtipaF3yAzMo851xA38ZQGae+eOIfjQ8MJtmND7CwW5m6cnL2i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IH+ARCtG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IH+ARCtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5C8C4CEE5;
	Tue,  8 Apr 2025 08:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744100187;
	bh=WE1ZZsKrmnSz2QHKwWvZ+H5UYZx+Uv7JHhT3+1LxJT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IH+ARCtGCCc2hvxeFOo6psWlwJ3u93MCb6Q2kGmRV12jFF2mJH9w0qmNqppqnzRO6
	 LKJY4ykwWxOnSajNDILbUmWf/5ggrKQZwMwHuXa9SP0Vaf8Fc5bnLYlY163w1b3LnC
	 D1+P3ppaW2DckvvvWs5ozeKQ8yiXA8ZPcouBZHIgP4zVOt5+YMekFrgaap8GdpLpAo
	 VP+TmOnqu+9L/3w8pvEZWY83Ul31+G0VJDMpTsOLAKs4eAo3ELu5NUE05K8t0AM9Y6
	 cBWPVy89+MCWOOKKxyTozx+O02S9MmNwB3PPnEI/k7bGFlVqcJf1NxP6QIgzq2sQAx
	 /37BIj6XehTJw==
Date: Tue, 8 Apr 2025 10:16:23 +0200
From: Christian Brauner <brauner@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, 
	David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org, yaneti@declera.com
Subject: Re: distrobox / podman / toolbox not working anymore with 6.15-rc1
Message-ID: <20250408-tonart-unkommentiert-1525c590f79b@brauner>
References: <0cfeab74-9197-4709-8620-78df7875cc9b@kernel.org>
 <9a6af7c9-bc77-4bcf-8a4c-2aea712ede25@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a6af7c9-bc77-4bcf-8a4c-2aea712ede25@kernel.org>

On Mon, Apr 07, 2025 at 03:54:17PM -0500, Mario Limonciello wrote:
> On 4/7/2025 10:48 AM, Mario Limonciello wrote:
> > Hello,
> > 
> > With upgrading to 6.15-rc1, the tools in the subject have stopped
> > working [1].  The following error is encountered when trying to enter a
> > container (reproduced using distrobox)
> > 
> > crun: chown /dev/pts/0: Operation not permitted: OCI permission denied
> > 
> > This has been root caused to:
> > 
> > commit cc0876f817d6d ("vfs: Convert devpts to use the new mount API")
> > 
> > Reverting this commit locally fixes the issue.
> > 
> > Link: https://github.com/89luca89/distrobox/issues/1722 [1]
> > 
> > Thanks,
> > 
> 
> David shared this on the Github thread:
> 
> https://lore.kernel.org/linux-fsdevel/759134.1743596274@warthog.procyon.org.uk/
> 
> I can confirm it fixes the issue.

The fix will go upstream this today or tomorrow. It's in -next
currently.
