Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DA1AD25
	for <regressions@lists.linux.dev>; Mon,  8 May 2023 19:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1683575065; x=1715111065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IdlXveSBrEnzAvq8Ep4fSHWjmFryj36YE8R7HO/fYGU=;
  b=HxNXAjh4HLXh3EkhUzI2GwzjmKcM6FfQ7TTxcuIc+bdoJk/wDy+x5F81
   GQiLXNTiGI6a7igjD8WyN5ymObtqPA96H53M3/f1YL/293qyX0pQd43pU
   I59Hvx3R4pHv5avfMWEND5fWNQSF3rA43/FM3NZPLjtqH/CcCy8MTq/z9
   A=;
X-IronPort-AV: E=Sophos;i="5.99,259,1677542400"; 
   d="scan'208";a="327316451"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-3554bfcf.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 19:44:20 +0000
Received: from EX19MTAUWB002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1e-m6i4x-3554bfcf.us-east-1.amazon.com (Postfix) with ESMTPS id 8A43D81040;
	Mon,  8 May 2023 19:44:17 +0000 (UTC)
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 8 May 2023 19:44:16 +0000
Received: from 88665a182662.ant.amazon.com (10.187.170.41) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 8 May 2023 19:44:14 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <kuba@kernel.org>, <anjali.rai@intel.com>
CC: <gregkh@linuxfoundation.org>, <jinen.gandhi@intel.com>,
	<joannelkoong@gmail.com>, <kailun.qin@intel.com>, <kuniyu@amazon.com>,
	<netdev@vger.kernel.org>, <regressions@lists.linux.dev>,
	<stable@vger.kernel.org>
Subject: Re: Regression Issue
Date: Mon, 8 May 2023 12:44:06 -0700
Message-ID: <20230508194406.73759-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230508123138.41b5dc48@kernel.org>
References: <20230508123138.41b5dc48@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.187.170.41]
X-ClientProxiedBy: EX19D033UWC002.ant.amazon.com (10.13.139.196) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
Precedence: Bulk

From: Jakub Kicinski <kuba@kernel.org>
Date: Mon, 8 May 2023 12:31:38 -0700
> On Mon, 8 May 2023 08:27:49 +0000 Rai, Anjali wrote:
> > On Mon, May 08, 2023 at 07:33:58AM +0000, Rai, Anjali wrote:
> >>> > We have one test which test the functionality of "using the same 
> >>> > loopback address and port for both IPV6 and IPV4", The test should 
> >>> > result in EADDRINUSE for binding IPv4 to same port, but it was 
> >>> > successful
> >>> > 
> >>> > Test Description:
> >>> > The test creates sockets for both IPv4 and IPv6, and forces IPV6 to 
> >>> > listen for both IPV4 and IPV6 connections; this in turn makes binding 
> >>> > another (IPV4) socket on the same port meaningless and results in 
> >>> > -EADDRINUSE
> >>> > 
> >>> > Our systems had Kernel v6.0.9 and the test was successfully executing, we recently upgraded our systems to v6.2, and we saw this as a failure. The systems which are not upgraded, there it is still passing.
> >>> > 
> >>> > We don't exactly at which point this test broke, but our assumption is
> >>> > https://github.com/torvalds/linux/commit/28044fc1d4953b07acec0da4d2fc4
> >>> > 784c57ea6fb  
> >>> 
> >>> Is there a specific reason you did not add cc: for the authors of that commit?
> >>> 
> >>> > Can you please check on your end whether this is an actual regression of a feature request.  
> >>>
> >>> If you revert that commit, does it resolve the issue?  Have you worked with the Intel networking developers to help debug this further?
> 
> > > I am part of Gramine OpenSource Project, I don't know someone from
> > > Intel Networking developers team, if you know someone, please feel
> > > free to add them.
> > > 
> > > Building completely linux source code and trying with different
> > > commits, I will not be able to do it today, I can check that may be
> > > tomorrow or day after. 
> >
> > The C code was passing earlier, and output was " test completed
> > successfully" but now with v6.2 it is failing and returning
> > "bind(ipv4) was successful even though there is no IPV6_V6ONLY on
> > same port\n"
> 
> Adding the mailing list and the experts. Cleaning up the quoting,
> please don't top post going forward.
> 
> Kuniyuki, have we seen this before?

Yes, we had the same report [0] and fixed with this patch [1], and it
seems to be backported to v6.1.21 and v6.2.8, not v6.0.y (EOL).

[0]: https://lore.kernel.org/netdev/e21bf153-80b0-9ec0-15ba-e04a4ad42c34@redhat.com/ 
[1]: https://lore.kernel.org/netdev/20230312031904.4674-2-kuniyu@amazon.com/
[2]: https://lore.kernel.org/stable/?q=tcp%3A+Fix+bind%28%29+conflict+check+for+dual-stack+wildcard+address.
