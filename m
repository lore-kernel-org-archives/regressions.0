Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CF3156F4A
	for <regressions@lists.linux.dev>; Wed, 25 Dec 2024 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735131115; cv=pass; b=Iuzdcn39aSNvT+goLTkMK5Pwb33sdhd6Qb2a7s2j+FJKudTURZn6YfKXfhGvJGQpiMpPXMbVCMyOVSiUiVj3pqMDsCWzc+4DoAYhZDO8l2VYPiItgFAUx9rquceL1b/h/HiisaakJG3yS7t39gkRLQSSn8qEm50rHDok+/62kU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735131115; c=relaxed/simple;
	bh=V4H3qGoE9W3PUBOyYxsklhRwIWPnUIljppzL+glOp3M=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=jixylUmO51zpW7oWTbOy3C0zwvinJJ4rU0wsS5efxZat/Svzx5+42OQQEmJkdOtzpnqju1CeE2jtjVLHoR/WoJIsxh9t2ouxbDKeBq0BOy/skkGhbkiFHwi00/1TjOm7sgjf3/C5+SqdlK9zBNd+rzhfwyLB0fgFbLBlskD6/XM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; spf=none smtp.mailfrom=xenosoft.de; dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=ETwfwcqJ; dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=LZUBhxU9; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="ETwfwcqJ";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="LZUBhxU9"
ARC-Seal: i=1; a=rsa-sha256; t=1735130928; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HlBS37GcAho7pPfEmy/xGBu6ulHDh+jGTVGDoms4Tbit/XFk/fNSrv0ED99g1SOVwm
    /JtkUrLhJtjz/EdlcTpq9aFQ99lN0iOFX80kIErcBdZFLAjJCgQzwI8aLSBYWUgNsFqr
    7ZZ1eGqd6FL8RB3wc7y/wxQFqfJnWwGEqkrGDi/jZUJ25ivSDefP5aakVAQgWmxAVmyp
    jFRzDRQTJTw9XYSSSfUkmPW044UplL39VEBpDC646kGF738Ab245u/RRVWOpVW7uFfjT
    YzZ16E3Rl1gZBkMk4XrteKjes9AbWyXHYcgIweRtlLU/OWjSWxMpxt3Ikc6NoZlyYENV
    K9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735130928;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=wJspGqQsSS7NlbzLg4iXsPohCxPlx0AOUnHVDlO0/+w=;
    b=L2+TOSHs2MB20P0x5aeHoF8Ai8BGRVtTRWX503SzmDyXleSc0IC0BNq4EbZKxtZteR
    hCls9tW1lyVLVOF4Gr+ADBWyPWZbWLIktmCmtYkT0q3UdCM8joSMBSXio8fpa2AdRu+l
    SOUxcrB4CNH3dF15tOXEZdbVYL8SWPZVjHTtzsTRuaw1n3bljnh8EBizR4wxzlIblHp5
    55BR0jN7jqX8WX+MXDAQo0zwlQCg7ufhd1r9yt7w5DHBnmeNDC+WDXD9L/xgNWIK9Gz0
    52Yxx5j7DmowVHGMV81ORWVelkcKumfgQGXYr4OfbOG8hyH7C/Y/8Mu2Ekd+Nb9eZRI+
    LZGw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735130928;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=wJspGqQsSS7NlbzLg4iXsPohCxPlx0AOUnHVDlO0/+w=;
    b=ETwfwcqJ/+wwDMfoUyqO+7VO4ylb727f7UBnPbdWNKfwY+e8aQ5aNprP2BZNqrx0Xm
    jJz7JUWPdLeYrGZ7AGwPKVy/B+PIzO7Ve1A/2wSAslS9YuW4aCOeWAMfbk0rCv0+8Qvx
    W3mKBPEHK2MIFHmD9lnmHX2MUNlyLOOYaMsDwCAq4EjMqdB5jbUrtG+8txSR6v61fJp0
    OWWJmM/jjpWF5J2MngtSFqwzlGBby08lefdEOZd8Dm+Hy9BbNmB0EInY+rYuLN+ilBMQ
    ddI1UIuNsEbqnTSSnEKyA8YBhRJsulbKbyQAHiyJW98GHqpryWYZnQDAQObZqq04H5XK
    FLTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735130928;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=wJspGqQsSS7NlbzLg4iXsPohCxPlx0AOUnHVDlO0/+w=;
    b=LZUBhxU9TfDpSbdhN8watiVP1ZKxWKlPE1Vig8QNduC+VkbzTnEm48zxy2KriGBXua
    I5XcLCB7qkPniXGqMUDQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EisT29BnYJMBKrhBYBGwL4fUrhbbg=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c90BPCmlDId
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 25 Dec 2024 13:48:47 +0100 (CET)
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Darren Stevens <darren@stevens-zone.net>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Christian Zigotzky <info@xenosoft.de>, madskateman@gmail.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 regressions@lists.linux.dev
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
 <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com>
 <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
 <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
 <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de>
 <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
 <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de>
 <2881940a-2da0-4498-b447-f09fffb14189@redhat.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <50149f09-174f-ad6e-e97d-3d8889b412a6@xenosoft.de>
Date: Wed, 25 Dec 2024 13:48:47 +0100
X-Mailer: BrassMonkey/33.4.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2881940a-2da0-4498-b447-f09fffb14189@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/12/24 12:42, Paolo Bonzini wrote:
> On 12/24/24 12:05, Christian Zigotzky wrote:
>> Hello Paolo,
>>
>> Thanks a lot for your patch.
>>
>> I tested it with the RC4 of kernel 6.13 today but unfortunately it 
>> doesn't solve the KVM HV issue. The guest system doesn't boot and I 
>> can't see any error messages. (console=ttyS0)
>
> But do you see anything on the host dmesg (without and with the 
> patch), for example a WARN?
Unfortunately no log during the start of KVM HV.
>
> Also you might try edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 + the 
> patch, to see if there are two bugs.
>
> Paolo
>
I think you mean 419cfb983ca93e75e905794521afefcfa07988bb because "git 
checkout edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4" doesn't work.

Error message: fatal: reference is not a tree: 
edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4

git checkout 419cfb983ca93e75e905794521afefcfa07988bb

Output:

Updating files: 100% (16656/16656), done.
Note: switching to '419cfb983ca93e75e905794521afefcfa07988bb'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.
...
HEAD is now at 419cfb983ca9 KVM: PPC: e500: Use __kvm_faultin_pfn() to 
handle page faults

---

patch -p0 < kvm_main.patch // Your patch

Output:

patching file a/virt/kvm/kvm_main.c

Oh dear, the host kernel doesn't boot. :-(

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)

