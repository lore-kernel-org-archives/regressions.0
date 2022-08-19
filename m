Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1F117EE
	for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 08:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2CIlI/i5kD70ZhhKElCJYvXGuqpWEWdE1++gdn9VbW0=; b=tfhbFzGRx9RcV9+M5J1fzQqkBz
	Bu+oCUN2G873DxjDAtlBbJ/u0kMkATMtBmaC3aslVEP74JiTKwsNU2lIiIcfNvBlH9o2xtwuhhqcQ
	Ro9H4Msh/gddudHnpwUKVSdChFHY2g8DPiOLGMpAit1FECqs1f3VTQthLKRoy9Ac9z7of2WRtpVEu
	Z04eA5ph88ab+DbumJqaLA0t8cvoRUPKXZNViPCcWhlFSKlvfGPR0mHx6SGxRAgXMyN+kjH3UDvvC
	En0jKbNh5sMbIDewsLITXO4P4fmWLftzhR5vDnW7qkC0ewMSkLvCPZeZ7XqkAf3oIj0v2gpLogMYw
	xcUeeaJA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxf0-00Avoi-TY; Fri, 19 Aug 2022 08:47:23 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id E157C980120; Fri, 19 Aug 2022 10:47:21 +0200 (CEST)
Date: Fri, 19 Aug 2022 10:47:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 1017425@bugs.debian.org,
	=?iso-8859-1?Q?Martin-=C9ric?= Racine <martin-eric.racine@iki.fi>,
	stable@vger.kernel.org, regressions@lists.linux.dev,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Subject: Re: [PATCH] x86/speculation: Avoid LFENCE in FILL_RETURN_BUFFER on
 CPUs that lack it
Message-ID: <Yv9OGVc+WpoDAB0X@worktop.programming.kicks-ass.net>
References: <Yv7aRJ/SvVhSdnSB@decadent.org.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Yv7aRJ/SvVhSdnSB@decadent.org.uk>

On Fri, Aug 19, 2022 at 02:33:08AM +0200, Ben Hutchings wrote:
> From: Ben Hutchings <benh@debian.org>
>=20
> The mitigation for PBRSB includes adding LFENCE instructions to the
> RSB filling sequence.  However, RSB filling is done on some older CPUs
> that don't support the LFENCE instruction.
>=20

Wait; what? There are chips that enable the RSB mitigations and DONT
have LFENCE ?!?
