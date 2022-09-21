Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC202F2A
	for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZgLg+iakMwAKwuSgDkBgwsil74YzMrT0fyk7bQYAOaQ=; b=XrLeRhY5JtnJeibn5eLYKGs/k/
	kaDfxLHdPX29zp0ITprBqKREL4QTASMn/eztBwMmgH3pJrLLHaTTg5veLBCdAB/Lzv0U3v3nLgxfZ
	Mdru50MXu7B0BShJdbdJ6c6PKgJAynmhiktQVKO/+49RQZFiAZE3ZCI6gMckzvTty/ny6FYGQvKGG
	f7xNUKvRi8OtAZYugKWykDuQrrXc0obnnX2m02tTbx+rMxujO1jN8do4wGhS5qlNOPyOaQGV+458+
	Hm79BtCllUhozaE4sE6I10vAX7EJyyvnzGpUxGKNirxuO8VxjoXtMcvTN0SlPW+rc+w8Hh6KIHOBl
	3ntoLTUg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob1DK-00EhIH-98; Wed, 21 Sep 2022 15:00:38 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E6CF6300202;
	Wed, 21 Sep 2022 17:00:35 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id C70682BB5A386; Wed, 21 Sep 2022 17:00:35 +0200 (CEST)
Date: Wed, 21 Sep 2022 17:00:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, rafael@kernel.org, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	dave.hansen@linux.intel.com, bp@alien8.de, tglx@linutronix.de,
	andi@lisas.de, puwen@hygon.cn, mario.limonciello@amd.com,
	rui.zhang@intel.com, gpiccoli@igalia.com, daniel.lezcano@linaro.org,
	ananth.narayan@amd.com, gautham.shenoy@amd.com,
	Calvin Ong <calvin.ong@amd.com>, stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] ACPI: processor_idle: Skip dummy wait for processors
 based on the Zen microarchitecture
Message-ID: <YysnE8rcZAOOj28A@hirez.programming.kicks-ass.net>
References: <20220921063638.2489-1-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921063638.2489-1-kprateek.nayak@amd.com>

On Wed, Sep 21, 2022 at 12:06:38PM +0530, K Prateek Nayak wrote:
> Processors based on the Zen microarchitecture support IOPORT based deeper
> C-states. 

I've just gotta ask; why the heck are you using IO port based idle
states in 2022 ?!?! You have have MWAIT, right?
