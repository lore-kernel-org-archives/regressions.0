Received: from len.romanrm.net (len.romanrm.net [91.121.86.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F82168B9
	for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 17:28:37 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
	by len.romanrm.net (Postfix) with SMTP id C2FC64010B;
	Wed, 16 Aug 2023 17:22:29 +0000 (UTC)
Date: Wed, 16 Aug 2023 22:22:29 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Roman
 Mamedov <rm+bko@romanrm.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Regressions
 <regressions@lists.linux.dev>, Linux KVM <kvm@vger.kernel.org>, Borislav
 Petkov <bp@alien8.de>
Subject: Re: kvm: Windows Server 2003 VM fails to work on 6.1.44 (works fine
 on 6.1.43)
Message-ID: <20230816222229.1877d6c8@nvm>
In-Reply-To: <87cyzn5cln.fsf@redhat.com>
References: <8cc000d5-9445-d6f1-f02e-4629a4a59e0e@gmail.com>
	<87o7j75g0g.fsf@redhat.com>
	<87il9f5eg1.fsf@redhat.com>
	<87cyzn5cln.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Aug 2023 15:41:08 +0200
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Sean's https://lore.kernel.org/all/20230811155255.250835-1-seanjc@google.com/
> (alteady in 'tip') can actually be related and I see it was already
> tagged for stable@. Can anyone check if it really helps?

Indeed, this patch appears to fix it. I built 6.1.46 with it added, and the
issue is no longer present. Thanks!

-- 
With respect,
Roman
