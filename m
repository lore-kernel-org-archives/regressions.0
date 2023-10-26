Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC5326E20
	for <regressions@lists.linux.dev>; Thu, 26 Oct 2023 09:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y8aNq0w4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mVCVx/S0"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698312430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IRhYRtBirUPXDp/2RewNMGJIV5PnhG7EQeVGJmNmtuY=;
	b=y8aNq0w4IgHdsQOLBrgI++aznBQayz2Ao5PgCcuI+uOPrtfJjNEXaS7+lnOeVOq33+WSDh
	nwGL72MOXJ0xgpOHddvdznTOPA45kSdRZijozg1+44v4G5tPj52A/A6Cr0RKmcX4kDDiyQ
	HV8HSpY4noacGCbN0ixRce388NEkzyZfyY+Jl+oJd52aJ00knRVPlehKoX3p0AUH81e0Jf
	YjDOTw0rozdK4B5OoxswpWMnOW0nrNaD78mtu47XS9UZyc5kIbOgpbMh1E3WW6plwsmFzK
	tplGndJKmTnf46xUPvRj8NEDh1UqW/VaUcxXVLWiF4CiC9WjLejj4WBa2os0mA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698312430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IRhYRtBirUPXDp/2RewNMGJIV5PnhG7EQeVGJmNmtuY=;
	b=mVCVx/S0ECmQ+yBQY50eCICD/Fu5vUhJPwB2i+xv8A8a2ZjIRc1w7qyHIGrC09kRuA2qT+
	mHvs4xG9wAv3ozAA==
To: Mario Limonciello <mario.limonciello@amd.com>, David Lazar
 <dlazar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, kys@microsoft.com,
 hpa@linux.intel.com, x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re:
In-Reply-To: <ad3affd0-58d3-41b3-8014-cb0fc953dc6d@amd.com>
References: <c8d43894-7e66-4a01-88fc-10708dc53b6b@amd.com>
 <878r7z4kb4.ffs@tglx> <e79dea49-0c07-4ca2-b359-97dd1bc579c8@amd.com>
 <87ttqhcotn.ffs@tglx> <87v8avawe0.ffs@tglx>
 <32bcaa8a-0413-4aa4-97a0-189830da8654@amd.com>
 <ZTkzYA3w2p3L4SVA@localhost> <87jzra6235.ffs@tglx> <875y2u5s8g.ffs@tglx>
 <ad3affd0-58d3-41b3-8014-cb0fc953dc6d@amd.com>
Date: Thu, 26 Oct 2023 11:27:09 +0200
Message-ID: <87ttqd4tua.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Oct 25 2023 at 17:11, Mario Limonciello wrote:
> On 10/25/2023 16:04, Thomas Gleixner wrote:
>> Cc: stable@vger.kernel.org
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218003
>
> s/Link/Closes/

Sure.

> Presumably you will add a proper subject when this is committed?

Bah, yes. I stopped replacing the subject line right after clearing it :(

> With adding title and fixing that tag:
>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
