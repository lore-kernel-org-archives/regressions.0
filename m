Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0410218C02
	for <regressions@lists.linux.dev>; Wed, 24 May 2023 15:03:36 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QRDvz74DMz4x4X;
	Thu, 25 May 2023 01:03:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684940609;
	bh=QzuYQR0gPXTiNpvk+XF3DiuPlqmiDTFoEMf5CPsp/LQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bf7RKUqiJYwZB6rIiKqXmpYDb9sFeIdXFk2IUeNjP7E8NNAeCOTLqymXJNOAorFjd
	 xWkU8ulUSYjTSdmKA+wMq4Ghu998sGrt51EoNi7pwkLUocpeZ1heayLdqssJP92wsZ
	 BJcX2JldrMHdKhkKSs6pkxXfxhQ1JJ1HmaZq0DTdEdtn090JmdjMzzn/zhdefc1vli
	 78BiKrDhT8CDAN3pP20RhCnQiid6BbStWe01B3C+/0BFq3vcJFi5zHEDRCIgpyp2RC
	 OZI9TQ8Q/sxnNbw8hjEbulhPfocWEjeb36x8Y2XVjEtzouoVHZylnT5v056FlXhcIj
	 nokuXbkIsUQ3w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Linux Regressions <regressions@lists.linux.dev>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Zi Yan
 <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, doru
 iorgulescu <doru.iorgulescu1@gmail.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Fabiano Rosas <farosas@linux.ibm.com>, Athira Rajeev
 <atrajeev@linux.vnet.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>
Subject: Re: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
In-Reply-To: <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
References: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
 <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
Date: Thu, 25 May 2023 01:03:22 +1000
Message-ID: <87bki9ai11.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:
> On 5/24/23 17:58, Bagas Sanjaya wrote:
>> Anyway, I'm adding it to regzbot:
>> 
>> #regzbot introduced: 23baf831a32c04f https://bugzilla.kernel.org/show_bug.cgi?id=217477
>> #regzbot title: Allocator MAX_ORDER exceeds SECTION_SIZE caused by MAX_ORDER redefinition
>> 
>
> From bugzilla [1], the reporter had successfully tried the proposed
> kernel config fix, so:
>
> #regzbot resolve: reducing CONFIG_ARCH_FORCE_MAX_ORDER to 8 resolves the regression

Should be fixed properly by:

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230519113806.370635-1-mpe@ellerman.id.au/

Which is in powerpc-fixes as 358e526a1648.

cheers
