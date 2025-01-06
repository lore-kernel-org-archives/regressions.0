Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C18BA34;
	Mon,  6 Jan 2025 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736192402; cv=none; b=su0aZVMC1ehEi5AwbfLQkH6TO7jD5OBxBeR1u9GCDl7n1Ez0PMooYK9DTbdXiOPqfR3ExgY9l5odT7Tx3Q+ok7ebKbhJfin9baSPHybEV6SnjBP/1LK+OFHJkG3ut3humF///HeAWgn0Ew+OvWdBB8GgQ2JGetCt9QpCZeA7T+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736192402; c=relaxed/simple;
	bh=0tJu/wUpm3Odc0y/zeqCNZw0V3O+hTweQ90dTSbXhGU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VHROpThqlxHa+evmRbFmbB9PED9HmpvV3/1RbgJD9ZXuDWyMAw6MTTrbz/CuZyei+1rgB5EH7uaSd/Wb7DT584uIgKTRg8/ort7uGN167EOVTjhfFkJ+74947FF9vLoxDV9a843egAIQP0Nawxx8N5Eu+7qdwKCoMUkzHAovBnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC4EC4CED2;
	Mon,  6 Jan 2025 19:40:00 +0000 (UTC)
Date: Mon, 6 Jan 2025 14:41:26 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Genes Lists <lists@sapience.com>
Cc: Andrea Amorosi <andrea.amorosi76@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lucas.demarchi@intel.com,
 regressions@lists.linux.dev, stable@vger.kernel.org,
 thomas.hellstrom@linux.intel.com
Subject: Re: [REGRESSION][BISECTED] Re: 6.12.7 stable new error: event
 xe_bo_move has unsafe dereference of argument 4
Message-ID: <20250106144126.20d7f599@gandalf.local.home>
In-Reply-To: <d5ef54d76188ec51d9e053fd097dc3f5bb6e6519.camel@sapience.com>
References: <9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
	<73129e45-cf51-4e8d-95e8-49bc39ebc246@gmail.com>
	<d5ef54d76188ec51d9e053fd097dc3f5bb6e6519.camel@sapience.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 04 Jan 2025 15:09:10 -0500
Genes Lists <lists@sapience.com> wrote:

> On Sat, 2025-01-04 at 18:43 +0100, Andrea Amorosi wrote:
> > Hi to all,
> > 
> > I've just updated my archlinux to |6.12.8-arch1-1 and I still get the
> > same issue:|
> > 
> >   
> Right - 6.12.8 (and Arch build of same) does not have Steve Rostedt's
> patch.
> The patch is in mainline and I believe it will be in 6.12.9.

For completeness, the patch in question is this:

  https://lore.kernel.org/20241231000646.324fb5f7@gandalf.local.home

-- Steve


> 
> Since the warning logged is a false positive it is benign.
> 
> 

