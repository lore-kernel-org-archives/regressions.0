Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86AC3D6F
	for <regressions@lists.linux.dev>; Tue, 28 Jun 2022 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656435213; x=1687971213;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=btsKwvH/DJEOr0VAnwqYMJeRJHamouJbM/1L9sC1LpE=;
  b=jcz1JTdhj87VDUktS9Xa1K//SzbG/y4yYIR4VmPOZ1WlsWPNYubZKSTn
   0ZoEO9ENXy/nd3nKPoK/K3slq1edQ9ldcpptimmwquA3ybK9O373UkeNP
   dIrjYX6G0gxAgoK4+xmrKzUx6NaCU/0vzH+uR9Rm5yM2Wz01txeE/jsSc
   9tbllhjU6ZPIosG+T5bivHbJfSjKZwawyqh9cNThVZ79LzDQzEIUVO1VC
   f2fqhg9X4oQ1VAALQVujG0WNJrWU4cqTC8yvr+Pd5YH9pi98BneVvXqif
   7XZttGTPCn/1sblwolg3N5XZpoDHOpQNcf5izcjc+3JYNKLdcDLqNxtVw
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="281829602"
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; 
   d="scan'208";a="281829602"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 09:53:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; 
   d="scan'208";a="587932914"
Received: from staibmic-mobl1.amr.corp.intel.com (HELO [10.209.67.166]) ([10.209.67.166])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 09:53:32 -0700
Message-ID: <de8d1830-9553-dd8f-8b12-308985c98b40@intel.com>
Date: Tue, 28 Jun 2022 09:52:28 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [REGRESSION] Unable to unlock encrypted disk starting with kernel
 5.19-rc1+
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, Alexandre Messier <alex@me.ssier.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de,
 Andrew.Cooper3@citrix.com, mingo@redhat.com, dave.hansen@linux.intel.com,
 x86@kernel.org, regressions@lists.linux.dev
References: <6025678c-e94a-6966-e298-82fad658a889@me.ssier.org>
 <YrrHwxtD2dpts7PF@zn.tnic>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <YrrHwxtD2dpts7PF@zn.tnic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

First of all, thank you for bisecting this!  I know those are a lot of work.

That XSAVEC patch modifies the AVX register save/restore code.  There is
a set of x86 AES acceleration instructions called AES-NI.  Those
instructions use the AVX registers.  So, it's at least a plausible
connection between that patch and your symptoms.  But, I don't think
anyone's been able to reproduce what you're seeing yet.

The kernel XSAVE buffer formats also differ slightly between AMD and
Intel.  That *should* be OK, but it might explain why I can't reproduce
this.

If you get a chance, could you apply this (ugly hackish) patch to the
userspace 'cryptsetup' utility and run it?

	https://sr71.net/~dave/intel/cryptsetup-memcmp.patch

On Ubuntu at least, it was as simple as:

	apt-get source cryptsetup
	apt-get build-dep cryptsetup
	cd cryptsetup-1.6.6
	./configure
	make

Then I could run:

	./src/cryptsetup benchmark --cipher=aes-xts --key-size=512
and
	./src/cryptsetup benchmark --cipher=aes-xts --key-size=256

With that patch applied, you should see some output like:

# ./src/cryptsetup benchmark --cipher=aes-xts --key-size=512
# Tests are approximate using memory only (no storage IO).
memcmp12: 0
memcmp23: 0
memcmp13: 0
memcmp12: -173
memcmp23: 173
memcmp13: 0
#  Algorithm | Key |  Encryption |  Decryption
     aes-xts   512b  4592.2 MiB/s  4192.0 MiB/s

The "memcmp13:" lines should both be 0.  That means that an encryption
and decryption cycle didn't change the data.  You *might* have to run
this in a loop if there's some kind of bad timing involved in triggering
the bug.

If you see a "memcmp13:" with something other than 0, that will narrow
things down and means we'll have a pretty quick reproducer that doesn't
involve luks which should speed things along.
