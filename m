Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8441FFC5C
	for <regressions@lists.linux.dev>; Mon, 14 Jul 2025 19:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752523077; cv=none; b=i+GtLxJoAhWvuLZEabyVE7msBSqeBFq2EjpI5ZtLJHnxU7UroFc8MvsCA12eWdoMga7oPxN5XY2AK9wWx5TKgyqfOCAloONh/QRMzjpDlh4z1hmdYUF0gVUkp0gm2Pa+qwoesyKoz8n4m53n7i/RNyJ/SI9/4ACyeT867E5cS6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752523077; c=relaxed/simple;
	bh=Uk5w1V6I4YwPMjZtuY2O0PIn9pPbYViPRep+5RgeIQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qKlDPGcYHNSBwhVtCkyj44MsKhJ1x+Jk1h6BzixchADNs4drlP5Rg4+5qDacGk9ECyxrBlbLoi0v/RfQv5dhm9zX2ThvFfsVKl2PZ5PnTqzhpKPhciOEpsIvruerkrgprk79By7UEmg/pKAabGhiKkpcyDysrWFL242SQoY94MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R214uWth; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R214uWth"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so10221885a12.2
        for <regressions@lists.linux.dev>; Mon, 14 Jul 2025 12:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752523074; x=1753127874; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=00htzvS//PxmAK1/kqageAXUez+cznfXa5IYx31PylU=;
        b=R214uWthjS69XsTi7GUAA5LHoPxAqIAc4aKvoQLg4r/+5+5KFuumA7x3CZIU+ynj6n
         Ywa3RmSiS0rucHpJkWxk4344Ok+UcXIizPs2nvphYV1XuhYO+R0ZfdY7OSX5ZD2HRcNd
         tglqR1kA/qGiwfqaNTIOjCHOseYHxs41004xBIZuVniQowlqz7yQjp5vls06oW4AtZXQ
         25gHjcg92W/gOgYzVdthy/wU7YmDEuKnHgvn05P5xSIeBDFEiywmpJ6T8JOTfePJyjlC
         wjsLYFyFuZe8TdRnUQ1XNC/j35Lsm0VeWPec2r7oOAetZoocRCnP6UqgGHT2svqlJJ6e
         aRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752523074; x=1753127874;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00htzvS//PxmAK1/kqageAXUez+cznfXa5IYx31PylU=;
        b=ekoxOm0m8OqUejeXjlR3RreUvGrDoBfoV4TF3AxShsXvIAF+SXe2NfYNEF69gisy5+
         7Vg8Gi9q6Opf6L5hhz//zPCr1xaMJ1+jg5rH0aP0ACTDhxgs/uRUTS/aAhXmicd2cktL
         IbUW9L3sEs3ynd+rq6aE1Ru88bWyFSPxHtiTodKneoia9WmlbKhYV4/xTdp5WytMmPOu
         iCBWiUvnzwOtmdjdv8aUoztyC3WbR6NCwDIXH4z+owiYjDUpbffSs5ZLz/zSn8gD95gd
         7Gmj0IIRxgGCDHbQ3cRsuO6wqpByqDkrLt4+jsKToJRDNoxg6ltGMKeu61kCxkOCVbzN
         joBg==
X-Forwarded-Encrypted: i=1; AJvYcCVEGWb9By4PCFvk3aOURFv3txszHiJgcw7nj8AIIYp8+wIhb0nHnIDgjS0bzVymujP7b90StYdlIaJe1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeLrL/uQjqg7HY/QMsZeprEQwcjcnVKnMgN3ndK6KwGjEB40eW
	zV116l8pPyw2vwNq7TQwGguaA3+ezN4owiILBc9kn8OmH4XiBzRcJ3jB
X-Gm-Gg: ASbGncvxmin5M4g7Ucs6TV44GLxzrm76u4Olnona/2aHtKfOwAEQ/GvqIYsmdBhdY0J
	TQbBtBseUYyCqWzMUrQbF7okJ2/95JoTu0SzWBbeZ/MDmW/kLZtSgQAx0nvDrm1MAcAOr9ffFQH
	i9DB1R91SlFou6RthgvUnPoZ0qtp/ljcIKp0HG7n7+ZK/bJxuQF7OH4Fgqrw44B0QLOGtXhtt3k
	lg/p+6vEtFssB5j4bduC6wzeFzd5z7G+zn+EpPJpV5E1s7vqRgLe3St8EofgE0bMN9bxSXWpmJX
	85epdhkH95i9uo3Czeyg0l3v0khkGK5qxVeop9++O7sWJ1KDtdxhCJR/caM6qq+kNy/2j4/FPbs
	ODmXrdIOzfG2mM0nqhBp+eaW1VdK8U4Wdii+HlyUe+EV4DOFQiEjvbCP1ulrB18qi4vyOfxEhFG
	F5
X-Google-Smtp-Source: AGHT+IG8cI1AwM6WE16Z8zxT3NpTjDoZqeS9GrJMxlRZ5DUBoix7AwUjHNbjadZtnPsAHQK/pQUcEg==
X-Received: by 2002:a17:906:c14b:b0:ae3:7b53:31b9 with SMTP id a640c23a62f3a-ae70125f453mr1245606366b.35.1752523073891;
        Mon, 14 Jul 2025 12:57:53 -0700 (PDT)
Received: from eldamar.lan (host-87-16-197-101.retail.telecomitalia.it. [87.16.197.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82952d2sm879782966b.140.2025.07.14.12.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:57:53 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 1052BBE2DE0; Mon, 14 Jul 2025 21:57:52 +0200 (CEST)
Date: Mon, 14 Jul 2025 21:57:52 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Guillaume Nault <gnault@redhat.com>,
	Stefano Brivio <sbrivio@redhat.com>,
	Aaron Conole <aconole@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Charles Bordet <rough.rock3059@datachamp.fr>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org, 1108860@bugs.debian.org
Subject: [regression] Wireguard fragmentation fails with VXLAN since
 8930424777e4 ("tunnels: Accept PACKET_HOST skb_tunnel_check_pmtu().")
 causing network timeouts
Message-ID: <aHVhQLPJIhq-SYPM@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Charles Bordet reported the following issue (full context in
https://bugs.debian.org/1108860)

> Dear Maintainer,
> 
> What led up to the situation?
> We run a production environment using Debian 12 VMs, with a network
> topology involving VXLAN tunnels encapsulated inside Wireguard
> interfaces. This setup has worked reliably for over a year, with MTU set
> to 1500 on all interfaces except the Wireguard interface (set to 1420).
> Wireguard kernel fragmentation allowed this configuration to function
> without issues, even though the effective path MTU is lower than 1500.
> 
> What exactly did you do (or not do) that was effective (or ineffective)?
> We performed a routine system upgrade, updating all packages include the
> kernel. After the upgrade, we observed severe network issues (timeouts,
> very slow HTTP/HTTPS, and apt update failures) on all VMs behind the
> router. SSH and small-packet traffic continued to work.
> 
> To diagnose, we:
> 
> * Restored a backup (with the previous kernel): the problem disappeared.
> * Repeated the upgrade, confirming the issue reappeared.
> * Systematically tested each kernel version from 6.1.124-1 up to
> 6.1.140-1. The problem first appears with kernel 6.1.135-1; all earlier
> versions work as expected.
> * Kernel version from the backports (6.12.32-1) did not resolve the
> problem.
> 
> What was the outcome of this action?
> 
> * With kernel 6.1.135-1 or later, network timeouts occur for
> large-packet protocols (HTTP, apt, etc.), while SSH and small-packet
> protocols work.
> * With kernel 6.1.133-1 or earlier, everything works as expected.
> 
> What outcome did you expect instead?
> We expected the network to function as before, with Wireguard handling
> fragmentation transparently and no application-level timeouts,
> regardless of the kernel version.

While triaging the issue we found that the commit 8930424777e4
("tunnels: Accept PACKET_HOST in skb_tunnel_check_pmtu()." introduces
the issue and Charles confirmed that the issue was present as well in
6.12.35 and 6.15.4 (other version up could potentially still be
affected, but we wanted to check it is not a 6.1.y specific
regression).

Reverthing the commit fixes Charles' issue.

Does that ring a bell?

Regards,
Salvatore
