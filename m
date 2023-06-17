Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com [162.0.218.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3155E1117
	for <regressions@lists.linux.dev>; Sat, 17 Jun 2023 19:27:53 +0000 (UTC)
Received: from MTA-09-4.privateemail.com (unknown [198.54.122.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 59E9560486
	for <regressions@lists.linux.dev>; Sat, 17 Jun 2023 19:27:45 +0000 (UTC)
Received: from mta-09.privateemail.com (localhost [127.0.0.1])
	by mta-09.privateemail.com (Postfix) with ESMTP id B926C18000AE;
	Sat, 17 Jun 2023 15:27:36 -0400 (EDT)
Received: from [192.168.2.177] (bras-base-toroon4332w-grc-19-174-93-80-116.dsl.bell.ca [174.93.80.116])
	by mta-09.privateemail.com (Postfix) with ESMTPA id A3C4E18000AA;
	Sat, 17 Jun 2023 15:27:32 -0400 (EDT)
Date: Sat, 17 Jun 2023 15:27:25 -0400
From: Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: KVM page-fault on Kernel 6.3.8
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-Id: <PPWEWR.10XLY20A3VQ43@effective-light.com>
In-Reply-To: <ZIz3aPL3K6ZagyJ2@google.com>
References: <L2ZBWR.TERFR10NPZ281@effective-light.com>
	<ZIz3aPL3K6ZagyJ2@google.com>
X-Mailer: geary/43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Virus-Scanned: ClamAV using ClamSMTP


On Fri, Jun 16 2023 at 04:59:36 PM -07:00:00, Sean Christopherson 
<seanjc@google.com> wrote:
> What makes you think this is KVM related?  I don't see anything KVM 
> related in

Well, it corresponds a QEMU crash.

> the splat.  The !PRESENT #PF is coming from aio_read(), not from KVM. 
>  The
> ?kvm_arch_vcpu_put line is just mispeculation from the unwinder.


