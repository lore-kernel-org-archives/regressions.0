Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520BA224AF8
	for <regressions@lists.linux.dev>; Fri, 14 Feb 2025 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523647; cv=none; b=ZsUNjJLq0sfw6FoRFWo1mgBXm7luOeLjPuHIrqmVJFXJdSVZX7xnGRy70zS5Ld5THhecPyglSkK3egv90sX0nH6BSOS92R9jYADoAHvxVuXzpm4PhRQaj7yRr1bcjnwEdPJYa9f6hQ9OmCnv15y8TH9XTubB7rda8TIBIOZObvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523647; c=relaxed/simple;
	bh=7lX+xYMFJh9I+bPXe+Txvhf9q+36wzQ9yi/jo6PJCcc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=i8Wq3IxvRdyQekz76VY9Xk4V1kFD+mRUH9TaQvWOnhEvBQZBaEkVlku+A6yQm4s8kozr9ZrboJmq/3FHuKK+7ZEq/3WkwLNFVvFJSCbvWsPub0CAdYirRhfZhaQw/vi8RL6Gq53HdRWkq/iam7xl/4ThR9HQpWJzRZZK4NVzGqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8+jBmjt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8+jBmjt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so12791425e9.0
        for <regressions@lists.linux.dev>; Fri, 14 Feb 2025 01:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739523642; x=1740128442; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BCeQRqKC2mbRi4qoCT2t+rHnwR2WSeqQ1KRGbRtrTlk=;
        b=D8+jBmjtL/AEZ9R64EDoUWQ9cezrPEALosfz9+jTl+/bsIslgiXGlgmaR6Uhmdlgoo
         6lbmEi1IEjJ5GCkfeLoSSxdwhYr0nlXz6ArhGUVg660Mee/Mr2ua59N/i/2BR71/Bt4v
         AQ0qcorvFEqGywapVv/sdzoqWaxROTGsr5JiWvC7jqjuvzF6xC1qOulwvDsxJ8ZVzeyi
         sShz3rn+N8mrvTWLfZgnJogxXgzQUhJ5wWVFQygjYtIlagEdjcEcCiWfTRfjumXPp3GQ
         IwtOX9xRn1DEnJ2/geEUQiYfWKw6ye9GB+xn9OximNKk1H3kY5i0rPxOuE7I2xBFYGIo
         oNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739523642; x=1740128442;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BCeQRqKC2mbRi4qoCT2t+rHnwR2WSeqQ1KRGbRtrTlk=;
        b=okWodKpIkNYDkJ7qhCA+5KVaA3pnyjuTefQgH41sZmll6GUg4UNVdjI61mrD43MpR9
         qWcAwDATewVU6abeiIPKqEciRqqzJCfg+BB2M6PpXfS86xH+Uow47fwXLWBh69r7utg0
         ERk8RqypIpvKcfTi+6+Gg1c/OoYwa7SW7AbLXIDC0AWux8DedYPH7vUXrb3YxSBahPdi
         /O2nmCE4MH4pop2ZyN+eySzHWyjh8fxema5YK63Dh6RkYVNMVK7/wnkbWzKKG7nk0K4z
         S4j/osHhdgyU5eepelYGWVs1i/KK8HWl07Jjbb2Ogufr1oVCgDAMnMe/IjmkVDDeflDZ
         L6QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnWAZSeqYMErdKTx7Y4rj5EpjYlmdn98PgtaUYewf84ma+w/pvNvAqyAmA/3Gl48oncRXMqQnBRYztWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxB+2vdgdckLosCy3gzdtTTanziHv2TgVRcpCZb0vfnLYORVA+4
	kKOFpercpYfhsEeQspP3Tp0y/qpNiJFZwEbU31illGT7nB/GN3YtneWoqXFqLUmG4KM5qqxofoh
	GRRMI8xSdhVuhJieru5LDIjMLkAw=
X-Gm-Gg: ASbGnctOJn+GcqFxTJ4RLHUV5X09kM0JnH6ECXNrCSJeLxk3HBSXktnPHx6YP9d1LDN
	A0iHmWsoZlDpAgIWGyXYAvWe88hiSNxm+oq56k4+pL/wvxLk6bovKGSB6N6T32tQY8TViPp3Fyt
	g=
X-Google-Smtp-Source: AGHT+IF15SfeQj3HA1ZMD+2sa81H/Bp7K68HgV09burIDohLpGXFpzE9CUzH85s9o55mFKj7h/Av1qPuDFotyK/ZIoA=
X-Received: by 2002:a05:600c:4e4f:b0:439:6332:275d with SMTP id
 5b1f17b1804b1-43963322a53mr64091465e9.2.1739523642375; Fri, 14 Feb 2025
 01:00:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Qiang Zhang <dtzq01@gmail.com>
Date: Fri, 14 Feb 2025 17:00:30 +0800
X-Gm-Features: AWEUYZnMyRVuMUo18B9Q4Cpr5cORWRavjMOpn-JsG2wYZUOafE0PZqTGJKToTB0
Message-ID: <CAPx+-5uvFxkhkz4=j_Xuwkezjn9U6kzKTD5jz4tZ9msSJ0fOJA@mail.gmail.com>
Subject: [RESEND]tc-flower not worked when configured dst_port and src_port
 range in one rule.
To: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, 
	Jiri Pirko <jiri@resnulli.us>, stable@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi, all.

recently met an issue: tc-flower not worked when configured dst_port
and src_port range in one rule.

detailed like this:
$ tc qdisc add dev ens38 ingress
$ tc filter add dev ens38 ingress protocol ip flower ip_proto udp \
  dst_port 5000 src_port 2000-3000 action drop

I try to find the root cause in kernel source code:
1. FLOW_DISSECTOR_KEY_PORTS and FLOW_DISSECTOR_KEY_PORTS_RANGE flag of
mask->dissector were set
in fl_classify from flow_dissector.c.
2. then skb_flow_dissect -> __skb_flow_dissect -> __skb_flow_dissect_ports.
3. FLOW_DISSECTOR_KEY_PORTS handled and FLOW_DISSECTOR_KEY_PORTS_RANGE
not handled
in __skb_flow_dissect_ports, so tp_range.tp.src was 0 here expected
the actual skb source port.

By the way, __skb_flow_bpf_to_target function may has the same issue.

Please help confirm and fix it, thank you.

source code of __skb_flow_dissect_ports in flow_dissector.c as below:

static void
__skb_flow_dissect_ports(const struct sk_buff *skb,
struct flow_dissector *flow_dissector,
void *target_container, const void *data,
int nhoff, u8 ip_proto, int hlen)
{
enum flow_dissector_key_id dissector_ports = FLOW_DISSECTOR_KEY_MAX;
struct flow_dissector_key_ports *key_ports;

if (dissector_uses_key(flow_dissector, FLOW_DISSECTOR_KEY_PORTS))
dissector_ports = FLOW_DISSECTOR_KEY_PORTS;
else if (dissector_uses_key(flow_dissector,
   FLOW_DISSECTOR_KEY_PORTS_RANGE))
dissector_ports = FLOW_DISSECTOR_KEY_PORTS_RANGE;

if (dissector_ports == FLOW_DISSECTOR_KEY_MAX)
return;

key_ports = skb_flow_dissector_target(flow_dissector,
     dissector_ports,
     target_container);
key_ports->ports = __skb_flow_get_ports(skb, nhoff, ip_proto,
data, hlen);
}

Best regards.
